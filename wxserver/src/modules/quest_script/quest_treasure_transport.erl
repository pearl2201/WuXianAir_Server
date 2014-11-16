%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
-module(quest_treasure_transport).

-include("pvp_define.hrl").

-compile(export_all).


com_script(QuestId)->
	QuestInfo = quest_db:get_info(QuestId),
	EverQId = quest_db:get_isactivity(QuestInfo),
	case everquest_op:get_cur_everquest_info(EverQId) of
		[]->
			nothing;
		EverQuestInfo->
          %%slogger:msg("quest_treasure_transport:com_script  QuestId:~p~n",[QuestId]),
			%%everquest_op:set_everquest_chance_used(EverQId),			set in quit or complete
			Quality = everquest_op:get_cur_qua_by_info(EverQuestInfo),
			%%give him a treasure car
			role_treasure_transport:accept_treasure_transport_quest(QuestId,Quality),

            %%��PK����ǰ̨���ã���ʱ��ע�͵�   by zhangting
			%%pvp_op:proc_set_pkmodel(?PVP_MODEL_KILLALL,timer_center:get_correct_now()),
			role_ride_op:hook_on_treasure_transport()
	end,
	[].




