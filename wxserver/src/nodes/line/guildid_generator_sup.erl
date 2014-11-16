%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
%%%-------------------------------------------------------------------
%%% File    : guildid_generator_sup.erl
%%% Author  : adrianx.lau
%%% Description : 
%%%
%%%-------------------------------------------------------------------
-module(guildid_generator_sup).

-behaviour(supervisor).

%% API
-export([
	 start_link/0
	]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================
%%--------------------------------------------------------------------
%% Function: start_link() -> {ok,Pid} | ignore | {error,Error}
%% Description: Starts the supervisor
%%--------------------------------------------------------------------
start_link() ->
	ServerId=env:get(serverid,undefined),
	case ServerId of
		undefined-> Error="can not start line,there is not serverid in configfile\n",
					slogger:msg("~p",[Error]),
					{error,Error};
		_-> supervisor:start_link({local, ?SERVER}, ?MODULE, [ServerId])
	end.
			
			

%%====================================================================
%% Supervisor callbacks
%%====================================================================
%%--------------------------------------------------------------------
%% Func: init(Args) -> {ok,  {SupFlags,  [ChildSpec]}} |
%%                     ignore                          |
%%                     {error, Reason}
%% Description: Whenever a supervisor is started using 
%% supervisor:start_link/[2,3], this function is called by the new process 
%% to find out about restart strategy, maximum restart frequency and child 
%% specifications.
%%--------------------------------------------------------------------
init([ServerId]) ->
  GuildIdConfig = {guildid_generator,{guildid_generator,start_link,[ServerId]},
	       permanent,2000,worker,[guildid_generator]},
	{ok,{{one_for_one, 10, 10}, [GuildIdConfig]}}.

%%====================================================================
%% Internal functions
%%====================================================================
