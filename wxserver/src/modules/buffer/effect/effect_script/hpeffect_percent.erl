%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
%% Author: adrian
%% Created: 2010-7-21
%% Description: TODO: Add description to hpeffect_percent
-module(hpeffect_percent).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([effect/2]).

%%
%% API Functions
%%

effect(Value,SkillInput)->
	[{hp,trunc(creature_op:get_hpmax_from_creature_info(get(creature_info))*Value/100)}].
%%
%% Local Functions
%%

