%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
%% Author: MacX
%% Created: 2010-12-6
%% Description: TODO: Add description to npc_equipment_stonemix
-module(npc_equipment_stonemix).

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
	npc_function_frame:add_function(equipment_stonemix_action,?NPC_FUNCTION_EQUIPMENT_STONEMIX, ?MODULE).

registe_func(_)->
	Mod= ?MODULE,
	Fun= equipment_stonemix_action,
	Arg= [],
	Response= #kl{key=?NPC_FUNCTION_EQUIPMENT_STONEMIX, value=[]},
	
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

