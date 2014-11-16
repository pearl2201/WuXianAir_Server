%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
%%%-------------------------------------------------------------------
%%% File    : itemid_generator_sup.erl
%%% Author  : adrianx.lau
%%% Description : 
%%%
%%%-------------------------------------------------------------------
-module(itemid_generator_sup).

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
					%%io:format(Error),
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
  ItemIdConfig = {itemid_generator,{itemid_generator,start_link,[ServerId]},
	       permanent,2000,worker,[itemid_generator]},
	{ok,{{one_for_one, 10, 10}, [ItemIdConfig]}}.

%%====================================================================
%% Internal functions
%%====================================================================
