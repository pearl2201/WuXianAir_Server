%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
-module(role_global_op).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([]).
-compile(export_all).

init()->
	put(global_nodes,global_node:get_all_global_nodes()).

export_for_copy()->
	get(global_nodes).

load_by_copy(Globals)->
	put(global_nodes,Globals).
