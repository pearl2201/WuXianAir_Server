%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
%% Author: Administrator
%% Created: 2013-5-18
%% Description: TODO: Add description to mnesia_operator2
-module(mnesia_operator2).
-define(DAL_WRITE_RECORD,'ets_dal_write_record').
%%
%% Include files
%%

%%
%%

%% Author: adrianx
%% Created: 2010-10-25
%% Description: TODO: Add description to dal


%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([init/0,set_write_flag/0,get_write_flag/0]).

-export([read_rpc/2,read/2,read_index_rpc/3,read_index/3,read_rpc/1,read/1,run_transaction_rpc/1,run_transaction/1,index_match_object_rpc/2,index_match_object/2]).
-export([write_rpc/1,write_rpc/4,write_rpc/5,write/1,write/4,write/5,async_write_rpc/1,async_write/1]).
-export([delete_rpc/2,delete/2,delete/4,delete_rpc/4,delete_object_rpc/1,delete_object/1]).
-export([clear_table/1,clear_table_rpc/1]).
-include_lib("stdlib/include/qlc.hrl").
%%
%% API Functions
%%
init()->
	try 
		ets:new(?DAL_WRITE_RECORD, [set,named_table,public]) 
	catch 
		E:R-> 
			slogger:msg("init_dal_write_record Exception(~p:~p)~n", [E,R])
	end.

%%
%% Local Functions
%%
read_rpc(Table)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, read, [Table]) of
					 {badrpc,Reason}-> slogger:msg("read_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("read_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
					 {ok,Result}-> {ok,Result};
					 _Any-> {failed,"read_rpc Unknown error"}
				 end
	end.

read_rpc(Table,Key)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> 
				case rpc:call(DbNode, ?MODULE, read, [Table,Key]) of
					 {badrpc,Reason}-> slogger:msg("read_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("read_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
					 {ok,Result}-> {ok,Result};
					 _Any-> {failed,"read_rpc Unknown error"}
				 end
	end.

read_index_rpc(Table,SecondaryKey,Pos)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, read_index, [Table,SecondaryKey,Pos]) of
					 {badrpc,Reason}-> slogger:msg("read_index_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("read_index_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
					 {ok,Result}-> {ok,Result};
					 _Any-> {failed,"read_rpc Unknown error"}
				 end
	end.

run_transaction_rpc(Trascation)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, run_transaction, [Trascation]) of
					 {badrpc,Reason}-> slogger:msg("run_transaction_rpc error ~p ~n",[Reason]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("run_transaction_rpc error ~p ~n",[Reason]),{failed,Reason};
					 {ok,Result}-> {ok,Result};
					 _Any-> {failed,"read_rpc Unknown error"}
				 end
	end.

index_match_object_rpc(Pattern,Pos)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, index_match_object, [Pattern,Pos]) of
					 {badrpc,Reason}-> slogger:msg("index_match_object_rpc error ~p Pattern ~p ~n",[Reason,Pattern]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("index_match_object_rpc error ~p Pattern ~p ~n",[Reason,Pattern]),{failed,Reason};
					 {ok,Result}-> {ok,Result};
					 _Any-> {failed,"read_rpc Unknown error"}
				 end
	end.
  
index_match_object(Pattern,Pos)-> 
	Q = fun()-> mnesia:index_match_object(Pattern,Pos) end,
	case mnesia:transaction(Q) of
		{atomic,Result}-> {ok,Result};
		{aborted,Reason}-> slogger:msg("index_match_object error ~p Pattern ~p ~n",[Reason,Pattern]),{failed,Reason}
	end.

read(Table)->
	ReadFun = fun()-> qlc:e(qlc:q([X || X <- mnesia:table(Table)])) end,
	case mnesia:transaction(ReadFun) of
		{aborted,Reason} -> slogger:msg("read error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
		{atomic, []}	 -> {ok,[]};
		{atomic, Result}-> {ok,Result}
	end.
	
read(Table,Key)->
	ReadFun = fun()-> mnesia:read({Table,Key}) end,
	case mnesia:transaction(ReadFun) of
		{aborted,Reason} -> slogger:msg("read error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
		{atomic, []}	 -> {ok,[]};
		{atomic, Result}-> {ok,Result}
	end.

read_index(Table,SecondaryKey,Pos)->
	ReadFun = fun()-> mnesia:index_read(Table, SecondaryKey, Pos)  end,
	case mnesia:transaction(ReadFun) of
		{aborted,Reason} -> slogger:msg("read_index error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
		{atomic, []}	 -> {ok,[]};
		{atomic, Result}-> {ok,Result}
	end.

run_transaction(Transaction)->
	case mnesia:transaction(Transaction) of
		{aborted,Reason} -> slogger:msg("run_transaction error ~p ~n",[Reason]),{failed,Reason};
		{atomic, []}	 -> {ok,[]};
		{atomic, Result}-> {ok,Result}
	end.

delete_rpc(Table,Key)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, delete, [Table,Key]) of
					 {badrpc,Reason}-> slogger:msg("delete_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("delete_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
					 {ok}-> {ok};
					 _Any-> {failed,"delete_rpc Unknown error"}
				 end
	end.

delete(Table,Key)->
	ReadFun = fun()-> mnesia:delete({Table,Key}) end,
	case mnesia:transaction(ReadFun) of
		{aborted,Reason} -> {failed,Reason};
		{atomic, ok}	 -> {ok}
	end.

delete_rpc(Table,TableKey,FieldIndex,FieldKey)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, delete, [Table,TableKey,FieldIndex,FieldKey]) of
					 {badrpc,Reason}-> slogger:msg("delete_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("delete_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
					 {ok}-> {ok};
					 _Any-> {failed,"delete_rpc Unknown error"}
				 end
	end.
	
delete(Table,TableKey,FieldIndex,FieldKey)->
	WriteFun = fun()->
					case mnesia:read(Table,TableKey) of
						[]-> failed;
						[Term]-> FieldValues = erlang:element(FieldIndex, Term),
								 case lists:keyfind(FieldKey, 1, FieldValues) of
									 false->
										 case lists:member(FieldKey, FieldValues) of
											 false-> ok;
											 _-> FieldValue = lists:delete(FieldKey, FieldValues),
												 Object = erlang:setelement(FieldIndex, Term, FieldValue),
												 mnesia:write(Object)
										 end;
									 _-> FieldValue = lists:keydelete(FieldKey, 1, FieldValues),
										 Object = erlang:setelement(FieldIndex, Term, FieldValue),
										 mnesia:write(Object)
								 end
					end
			   end,
	case mnesia:transaction(WriteFun) of
		{aborted,Reason} -> slogger:msg("delete_object error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
		{atomic, failed} -> slogger:msg("delete_object Table ~p ~n",[Table]),{failed,"read table failed when write"};
		{atomic, ok}	 -> {ok}
	end.

delete_object_rpc(Object)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, delete_object, [Object]) of
					 {badrpc,Reason}-> slogger:msg("delete_object error ~p Object ~p ~n",[Reason,Object]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("delete_object error ~p Object ~p ~n",[Reason,Object]),{failed,Reason};
					 {ok}-> {ok};
					 _Any-> {failed,"delete_object_rpc Unknown error"}
				 end
	end.

delete_object(Object)->
	ReadFun = fun()-> mnesia:delete_object(Object) end,
	case mnesia:transaction(ReadFun) of
		{aborted,Reason} -> slogger:msg("delete_object error ~p Object ~p ~n",[Reason,Object]),{failed,Reason};
		{atomic, ok}	 -> {ok}
	end.


write_rpc(Object)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, write, [Object]) of
					 {badrpc,Reason}-> slogger:msg("write_rpc error ~p Object ~p ~n",[Reason,Object]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("write_rpc error ~p Object ~p ~n",[Reason,Object]),{failed,Reason};
					 {ok}-> {ok};
					 _Any-> slogger:msg("write_rpc exception Object ~p ~n",[Object]),{failed,"write_rpc Unknown error"}
				 end
	end.
	
write_rpc(Table,TableKey,FieldIndex,Value)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, write, [Table,TableKey,FieldIndex,Value]) of
					 {badrpc,Reason}-> slogger:msg("write_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("write_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
					 {ok}-> {ok};
					 _Any-> {failed,"write_rpc Unknown error"}
				 end
	end.

write_rpc(Table,TableKey,FieldIndex,FieldKey,FieldTupleValue)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, write, [Table,TableKey,FieldIndex,FieldKey,FieldTupleValue]) of
					 {badrpc,Reason}-> slogger:msg("write_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("write_rpc error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
					 {ok}-> {ok};
					 _Any-> {failed,"write_rpc Unknown error"}
				 end
	end.



write(Object)->
	WriteFun = fun()->mnesia:write(Object)end ,
	case mnesia:transaction(WriteFun) of
		{aborted,Reason} -> slogger:msg("write error ~p Object ~p ~n",[Reason,Object]),{failed,Reason};
		 {atomic, ok}	 -> {ok}
	end.

write(Table,TableKey,FieldIndex,Value)->
	WriteFun = fun()->
					case mnesia:read(Table,TableKey) of
						[]-> error;
						[Term]-> Object = erlang:setelement(FieldIndex, Term, Value),
								 mnesia:write(Object)
					end
			   end ,
	case mnesia:transaction(WriteFun) of
		{aborted,Reason} -> slogger:msg("write error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
		{atomic, failed} -> slogger:msg("write error Table ~p ~n",[Table]),{failed,"read table failed when write"};
		{atomic, ok}	 -> {ok}
	end.

write(Table,TableKey,FieldIndex,FieldKey,FieldTupleValue)->
	WriteFun = fun()->
					case mnesia:read(Table,TableKey) of
						[]-> failed;
						[Term]-> FieldValues = erlang:element(FieldIndex, Term),
								 NewFieldValue = case is_tuple(FieldTupleValue) of
												  true->
													  if erlang:element(1, FieldTupleValue) == FieldKey->
															 case lists:keyfind(FieldKey, 1, FieldValues) of
																 false-> FieldValues ++ [FieldTupleValue];
																 _-> lists:keyreplace(FieldKey, 1, FieldValues, FieldTupleValue)
															 end;
														 true->
															 case lists:member(FieldTupleValue, FieldValues) of
																 false-> FieldValues ++ [FieldTupleValue];
																 _-> FieldValues
															 end
													  end;
												  false->
													  case lists:member(FieldTupleValue, FieldValues) of
														  false-> FieldValues ++ [FieldTupleValue];
														  _-> FieldValues
													  end
											  end,			 
								 Object = erlang:setelement(FieldIndex, Term, NewFieldValue),
								 mnesia:write(Object)
					end
			   end ,
	case mnesia:transaction(WriteFun) of
		{aborted,Reason} -> slogger:msg("write error ~p Table ~p ~n",[Reason,Table]),{failed,Reason};
		{atomic, failed} -> slogger:msg("write error Table ~p ~n",[Table]),{failed,"read table failed when write"};
		{atomic, ok}	 -> {ok}
	end.
	
async_write_rpc(Object)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, async_write, [Object]) of
					 {badrpc,Reason}-> slogger:msg("async_write_rpc error ~p Object ~p ~n",[Reason,Object]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("async_write_rpc error ~p Object ~p ~n",[Reason,Object]),{failed,Reason};
					 {ok}-> {ok};
					 _Any-> {failed,"write_rpc Unknown error"}
				 end
	end.

async_write(Object)->
	try
		WriteFun = fun()->mnesia:write(Object)end,
		mnesia:activity(async_dirty,WriteFun),
		{ok}
	catch
		_E:Reason-> slogger:msg("async_write error ~p Object ~p ~n",[Reason,Object]),{failed,Reason}
	end.

clear_table_rpc(Object)->
	case node_util:get_dbnode() of
		undefined-> {nonode};
		DbNode-> case rpc:call(DbNode, ?MODULE, clear_table, [Object]) of
					 {badrpc,Reason}-> slogger:msg("clear_table_rpc error ~p Object ~p ~n",[Reason,Object]),{failed,badrpc,Reason};
					 {failed,Reason}-> slogger:msg("clear_table_rpc error ~p Object ~p ~n",[Reason,Object]),{failed,Reason};
					 {ok}-> {ok};
					 _Any-> {failed,"write_rpc Unknown error"}
				 end
	end.

clear_table(TableName)->
	case mnesia:clear_table(TableName) of
		{aborted,Reason} -> slogger:msg("clear_table error ~p TableName ~p ~n",[Reason,Reason]),{failed,Reason};
		{atomic, ok}	 -> {ok}
	end.

set_write_flag()->
	ets:insert(?DAL_WRITE_RECORD,{1,now()}).

get_write_flag()->
	case ets:lookup(?DAL_WRITE_RECORD, 1) of
		[]-> undefined;
		[{_,Time}]->Time
	end.
