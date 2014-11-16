%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
%%% -------------------------------------------------------------------
%%% Author  : adrian
%%% Description :
%%%
%%% Created : 2010-4-2
%%% -------------------------------------------------------------------
-module(gm_acceptor).

-behaviour(gen_server).
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% External exports
-export([start_link/2,disable_connect/1,enable_connect/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {callback, sock, ref, disable_connect}).

%% ====================================================================
%% External functions
%% ====================================================================
start_link(Callback, LSock) ->
    gen_server:start_link(?MODULE, {Callback, LSock}, []).

%% ====================================================================
%% Server functions
%% ====================================================================
disable_connect(Pid)->
	gen_server:call(Pid, {disable_connect}).

enable_connect(Pid)->
	gen_server:call(Pid, {enable_connect}).
%% --------------------------------------------------------------------
%% Function: init/1
%% Description: Initiates the server
%% Returns: {ok, State}          |
%%          {ok, State, Timeout} |
%%          ignore               |
%%          {stop, Reason}
%% --------------------------------------------------------------------
init({Callback, LSock}) ->
    gen_server:cast(self(), accept),
    {ok, #state{callback=Callback, sock=LSock}}.

%% --------------------------------------------------------------------
%% Function: handle_call/3
%% Description: Handling call messages
%% Returns: {reply, Reply, State}          |
%%          {reply, Reply, State, Timeout} |
%%          {noreply, State}               |
%%          {noreply, State, Timeout}      |
%%          {stop, Reason, Reply, State}   | (terminate/2 is called)
%%          {stop, Reason, State}            (terminate/2 is called)
%% --------------------------------------------------------------------
handle_call({disable_connect}, _From, State) ->
    Reply = State,
    {reply, Reply, State#state{disable_connect=true}};
handle_call({enable_connect}, _From, State) ->
    Reply = State,
    {reply, Reply, State#state{disable_connect=false}};

handle_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.

%% --------------------------------------------------------------------
%% Function: handle_cast/2
%% Description: Handling cast messages
%% Returns: {noreply, State}          |
%%          {noreply, State, Timeout} |
%%          {stop, Reason, State}            (terminate/2 is called)
%% --------------------------------------------------------------------
handle_cast(accept, State) ->
    accept(State);

handle_cast(_Msg, State) ->
    {noreply, State}.

%% --------------------------------------------------------------------
%% Function: handle_info/2
%% Description: Handling all non call/cast messages
%% Returns: {noreply, State}          |
%%          {noreply, State, Timeout} |
%%          {stop, Reason, State}            (terminate/2 is called)
%% --------------------------------------------------------------------
handle_info({inet_async, LSock, Ref, {ok, Sock}},
            State = #state{callback={M,F,A}, sock=LSock, ref=Ref, disable_connect=Disable}) ->

    %% patch up the socket so it looks like one we got from
    %% gen_tcp:accept/1
    {ok, Mod} = inet_db:lookup_socket(LSock),
    inet_db:register_socket(Sock, Mod),

    try
        %% report
        {Address, Port}         = inet_op(fun () -> inet:sockname(LSock) end),
        {PeerAddress, PeerPort} = inet_op(fun () -> inet:peername(Sock) end),
        slogger:msg("accepted TCP connection on ~s:~p from ~s:~p~n",
                              [inet_parse:ntoa(Address), Port,
                               inet_parse:ntoa(PeerAddress), PeerPort]),
        %% handle
    
		%% start gm_client
	    {ok, ChildPid} = supervisor:start_child(gm_client_sup, []),
    	
		ok = gen_tcp:controlling_process(Sock, ChildPid),
		case Disable of
			false->
				gm_client:socket_ready(node(),ChildPid,Sock);
			true->
				gm_client:socket_disable(node(),ChildPid,Sock)
		end,
		
 		apply(M, F, A ++ [Sock,ChildPid])
		
    catch {inet_error, Reason} ->
            gen_tcp:close(Sock),
            error_logger:error_msg("unable to accept TCP connection: ~p~n",
                                   [Reason])
    end,

    %% accept more
    accept(State);

handle_info({inet_async, LSock, Ref, {error, closed}},
            State=#state{sock=LSock, ref=Ref}) ->
    %% It would be wrong to attempt to restart the acceptor when we
    %% know this will fail.
    {stop, normal, State};

handle_info(_Info, State) ->
    {noreply, State}.

%% --------------------------------------------------------------------
%% Function: terminate/2
%% Description: Shutdown the server
%% Returns: any (ignored by gen_server)
%% --------------------------------------------------------------------
terminate(_Reason, _State) ->
    ok.

%% --------------------------------------------------------------------
%% Func: code_change/3
%% Purpose: Convert process state when code is changed
%% Returns: {ok, NewState}
%% --------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% --------------------------------------------------------------------
%%% Internal functions
%% --------------------------------------------------------------------
%%--------------------------------------------------------------------
throw_on_error(E, Thunk) ->
    case Thunk() of
        {error, Reason} -> throw({E, Reason});
        {ok, Res}       -> Res;
        Res             -> Res
    end.

inet_op(F) -> throw_on_error(inet_error, F).

accept(State = #state{sock=LSock}) ->
    case prim_inet:async_accept(LSock, -1) of
        {ok, Ref} -> {noreply, State#state{ref=Ref}};
        Error     -> {stop, {cannot_accept, Error}, State}
    end.
