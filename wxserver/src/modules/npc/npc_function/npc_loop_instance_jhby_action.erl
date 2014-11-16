%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
%% Author: zhanglei
%% Created: 2012-1-13
%% Description: TODO: Add description to npc_loop_instance_jhby_action
-module(npc_loop_instance_jhby_action).

%%
%% Include files
%%
-include("login_pb.hrl").
-include("npc_define.hrl").
%%
%% Exported Functions
%%
-behaviour(npc_function_mod).

-export([init_func/0,registe_func/1,enum/3]).

%%
%% API Functions
%%
init_func()->
	npc_function_frame:add_function(npc_loop_instance_jhby_action,?NPC_FUNCTION_LOOP_INSTANCE_JHBY, ?MODULE).

registe_func(_)->
	Mod= ?MODULE,
	Fun= npc_loop_instance_jhby_action,
	Arg= [],
	Response= #kl{key=?NPC_FUNCTION_LOOP_INSTANCE_JHBY, value=[]},
	
	EnumMod = ?MODULE,
	EnumFun = enum,
	EnumArg = [],
	Action = {Mod,Fun,Arg},
	Enum   = {EnumMod,EnumFun,EnumArg},
	
	{Response,Action,Enum}.

enum(_,_,_)->
	ignor.


%%
%% Local Functions
%%

