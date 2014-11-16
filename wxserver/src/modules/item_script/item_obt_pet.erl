%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
-module(item_obt_pet).
-export([use_item/1,use_egg/4]).
-include("data_struct.hrl").
-include("item_struct.hrl").

use_item(ItemInfo)->
	[ProtoId] = get_states_from_iteminfo(ItemInfo),
	Quality = get_qualty_from_iteminfo(ItemInfo)+1,
	Type=random:uniform(4),
	pet_op:apply_create_pet(ProtoId,Type,Quality).

%%使用宠物蛋执行特殊脚本<枫少>
use_egg(Type,ItemInfo,Script,Proto)->
	ProtoInfo=get_states_from_iteminfo(ItemInfo),
	%%Pinfo=egg_to_list(ProtoInfo),
	case Proto of 
		1->ProtoId=2;
		2->ProtoId=12;
		3->ProtoId=6;
		4->ProtoId=21;
		_->ProtoId=2
	end,
	%%[ProtoId|Value]=lists:keyfind(Type, 1,Pinfo),
	Quality = get_qualty_from_iteminfo(ItemInfo)+1,
	pet_op:apply_create_pet(ProtoId,Type,Quality).
	

%%将list转化为tuple<枫少>
%%egg_to_list([])->
%%	[];
%%egg_to_list([H|T])->
%%	[list_to_tuple(H)]++egg_to_list(H).
	
