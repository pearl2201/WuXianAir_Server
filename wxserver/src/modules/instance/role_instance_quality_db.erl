%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
%% Author: yanzengyan
%% Created: 2012-8-3
%% Description: TODO: Add description to role_instance_quality_db
-module(role_instance_quality_db).

-include("mnesia_table_def.hrl").

-compile(export_all).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 						behaviour export
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-export([start/0,create_mnesia_table/1,create_mnesia_split_table/2,delete_role_from_db/1,tables_info/0]).

-behaviour(db_operater_mod).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 				behaviour functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start()->
	db_operater_mod:start_module(?MODULE,[]).

create_mnesia_table(disc)->
	nothing.

create_mnesia_split_table(role_instance_quality,TrueTabName)->
	db_tools:create_table_disc(TrueTabName,record_info(fields,role_instance_quality),[],set).

delete_role_from_db(RoleId)->
	TableName = db_split:get_owner_table(role_instance_quality, RoleId),
	dal:delete_rpc(TableName, RoleId).

tables_info()->
	[{role_instance_quality,disc_split}].
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 				behaviour functions end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_instance_quality(RoleId)->
	TableName = db_split:get_owner_table(role_instance_quality, RoleId),
	case dal:read_rpc(TableName,RoleId) of
		{ok,[R]}-> R;
		{ok,[]}->[];
		{failed,badrpc,_Reason}->{TableName,RoleId,[]};
		{failed,_Reason}-> {TableName,RoleId,[]}
	end.
	
get_instance_quality(RoleId,Info, Ext)->
	TableName = db_split:get_owner_table(role_instance_quality, RoleId),
	dmp_op:sync_write(RoleId,{TableName,RoleId,Info, Ext}).

save_role_instance_info(RoleId,RoleId,Info, Ext)->
	TableName = db_split:get_owner_table(role_instance, RoleId),
	dmp_op:sync_write(RoleId,{TableName,RoleId,RoleId,Info, Ext}).

async_save_role_instance_info(RoleId,Info, Ext)->
	TableName = db_split:get_owner_table(role_instance_quality, RoleId),
	dmp_op:async_write(RoleId,{TableName,RoleId,Info, Ext}).

get_quality_info(RoleInstanceQuality) ->
	case RoleInstanceQuality of
		[]->[];
		_->
			erlang:element(#role_instance_quality.info, RoleInstanceQuality)
	end.

get_quality_ext(RoleInstanceQuality) ->
	case RoleInstanceQuality of
		[]->[];
		_->
			erlang:element(#role_instance_quality.ext, RoleInstanceQuality)
	end.

get_quality_quality(RoleInstanceQuality) ->
	case RoleInstanceQuality of
		[]->[];
		_->
			erlang:element(#role_instance_quality.quality, RoleInstanceQuality)
	end.
