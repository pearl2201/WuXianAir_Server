%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
%% Author: MacX
%% Created: 2010-11-29
%% Description: TODO: Add description to npc_equipment
-module(npc_equipment_sock_action).

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
	npc_function_frame:add_function(equipment_sock_action,?NPC_FUNCTION_EQUIPMENT_SOCK, ?MODULE).

registe_func(_)->
	Mod= ?MODULE,
	Fun= equipment_sock_action,
	Arg= [],
	Response= #kl{key=?NPC_FUNCTION_EQUIPMENT_SOCK, value=[]},
	
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

