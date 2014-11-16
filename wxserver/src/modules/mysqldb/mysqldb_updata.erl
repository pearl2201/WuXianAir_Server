%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
%% Author: Administrator
%% Created: 2013-6-4
%% Description: TODO: Add description to mysqldb_updata
-module(mysqldb_updata).
%% Author: Administrator
%% Created: 2013-5-9
%% Description: TODO: Add description to uppdate_mysqldb
-compile(export_all).
-include("config_db_def.hrl").
-define(DB, conn).
%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([]).

%%
%% API Functions
%%



%%
%% Local Functions
	
update_data(account,Object)->
	TermInfo=record_info(fields,account),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(account,NewInfo);

update_data(achieve_role,Object)->
	TermInfo=record_info(fields,achieve_role),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(achieve_role,NewInfo);

update_data(activity_info_db,Object)->
	TermInfo=record_info(fields,activity_info_db),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(activity_info_db,NewInfo);

update_data(activity_test01_role,Object)->
	TermInfo=record_info(fields,activity_test01_role),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(activity_test01_role,NewInfo);

update_data(answer_roleinfo,Object)->
	TermInfo=record_info(fields,answer_roleinfo),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(answer_roleinfo,NewInfo);

update_data(auto_name_used,Object)->
	TermInfo=record_info(fields,auto_name_used),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(auto_name_used,NewInfo);

update_data(background_welfare_data,Object)->
	TermInfo=record_info(fields,background_welfare_data),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(background_welfare_data,NewInfo);

update_data(black,Object)->
	TermInfo=record_info(fields,black),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(black,NewInfo);

update_data(christmas_tree_db,Object)->
	TermInfo=record_info(fields,christmas_tree_db),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(christmas_tree_db,NewInfo);

update_data(consume,Object)->
	TermInfo=record_info(fields,consume),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(consume,NewInfo);


update_data(consume_return_info,Object)->
	TermInfo=record_info(fields,consume_return_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(consume_return_info,NewInfo);

update_data(country_record,Object)->
	TermInfo=record_info(fields,country_record),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(country_record,NewInfo);

update_data(enchant_extremely_property_opt,Object)->
	TermInfo=record_info(fields,enchant_extremely_property_opt),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(enchant_extremely_property_opt,NewInfo);

update_data(facebook_bind,Object)->
	TermInfo=record_info(fields,facebook_bind),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(facebook_bind,NewInfo);

update_data(fatigue,Object)->
	TermInfo=record_info(fields,fatigue),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(fatigue,NewInfo);

update_data(festival_recharge_gift_bg,Object)->
	TermInfo=record_info(fields,festival_recharge_gift_bg),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(festival_recharge_gift_bg,NewInfo);

update_data(friend,Object)->
	TermInfo=record_info(fields,friend),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(friend,NewInfo);

update_data(giftcards,Object)->
	TermInfo=record_info(fields,giftcards),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(giftcards,NewInfo);

update_data(global_exp_addition_db,Object)->
	TermInfo=record_info(fields,global_exp_addition_db),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(global_exp_addition_db,NewInfo);

update_data(global_monster_loot_db,Object)->
	TermInfo=record_info(fields,global_monster_loot_db),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(global_monster_loot_db,NewInfo);

update_data(gm_blockade,Object)->
	TermInfo=record_info(fields,gm_blockade),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(gm_blockade,NewInfo);

update_data(gm_notice,Object)->
	TermInfo=record_info(fields,gm_notice),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(gm_notice,NewInfo);

update_data(goals_role,Object)->
	TermInfo=record_info(fields,goals_role),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(goals_role,NewInfo);

update_data(guild_baseinfo,Object)->
	TermInfo=record_info(fields,guild_baseinfo),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_baseinfo,NewInfo);

update_data(guild_battle_result,Object)->
	TermInfo=record_info(fields,guild_battle_result),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_battle_result,NewInfo);

update_data(guild_battle_score,Object)->
	TermInfo=record_info(fields,guild_battle_score),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_battle_score,NewInfo);

update_data(guild_events,Object)->
	TermInfo=record_info(fields,guild_events),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_events,NewInfo);

update_data(guild_facility_info,Object)->
	TermInfo=record_info(fields,guild_facility_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_facility_info,NewInfo);

update_data(guild_impeach_info,Object)->
	TermInfo=record_info(fields,guild_impeach_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_impeach_info,NewInfo);

update_data(guild_leave_member,Object)->
	TermInfo=record_info(fields,guild_leave_member),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_leave_member,NewInfo);

update_data(guild_log,Object)->
	TermInfo=record_info(fields,guild_log),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_log,NewInfo);

update_data(guild_member_shop,Object)->
	TermInfo=record_info(fields,guild_member_shop),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_member_shop,NewInfo);

update_data(guild_member_treasure,Object)->
	TermInfo=record_info(fields,guild_member_treasure),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_member_treasure,NewInfo);

update_data(guild_member,Object)->
	TermInfo=record_info(fields,guild_member),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_member,NewInfo);

update_data(guild_right_limit,Object)->
	TermInfo=record_info(fields,guild_right_limit),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_right_limit,NewInfo);

update_data(guild_treasure_price,Object)->
	TermInfo=record_info(fields,guild_treasure_price),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_treasure_price,NewInfo);

update_data(guilditems,Object)->
	TermInfo=record_info(fields,guilditems),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guilditems,NewInfo);

update_data(guildpackage_apply,Object)->
	TermInfo=record_info(fields,guildpackage_apply),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guildpackage_apply,NewInfo);

update_data(idmax,Object)->
	TermInfo=record_info(fields,idmax),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(idmax,NewInfo);

update_data(jszd_role_score_honor,Object)->
	TermInfo=record_info(fields,jszd_role_score_honor),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(jszd_role_score_honor,NewInfo);

update_data(jszd_role_score_info,Object)->
	TermInfo=record_info(fields,jszd_role_score_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(jszd_role_score_info,NewInfo);

update_data(loop_instance_record,Object)->
	TermInfo=record_info(fields,loop_instance_record),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(loop_instance_record,NewInfo);

update_data(loop_tower_instance,Object)->
	TermInfo=record_info(fields,loop_tower_instance),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(loop_tower_instance,NewInfo);

update_data(mail,Object)->
	TermInfo=record_info(fields,mail),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(mail,NewInfo);

update_data(offline_exp_rolelog,Object)->
	TermInfo=record_info(fields,offline_exp_rolelog),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(offline_exp_rolelog,NewInfo);

update_data(open_service_activitied_control,Object)->
	TermInfo=record_info(fields,open_service_activitied_control),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(open_service_activitied_control,NewInfo);

update_data(pet_advance_reset_time,Object)->
	TermInfo=record_info(fields,pet_advance_reset_time),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(pet_advance_reset_time,NewInfo);

update_data(pet_explore_background,Object)->
	TermInfo=record_info(fields,pet_explore_background),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(pet_explore_background,NewInfo);

update_data(pet_explore_info,Object)->
	TermInfo=record_info(fields,pet_explore_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(pet_explore_info,NewInfo);

update_data(pet_explore_storage,Object)->
	TermInfo=record_info(fields,pet_explore_storage),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(pet_explore_storage,NewInfo);

update_data(pet_shop_info,Object)->
	TermInfo=record_info(fields,pet_shop_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(pet_shop_info,NewInfo);

update_data(pets,Object)->
	TermInfo=record_info(fields,pets),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(pets,NewInfo);

update_data(player_option,Object)->
	TermInfo=record_info(fields,player_option),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(player_option,NewInfo);

update_data(playeritems,Object)->
	TermInfo=record_info(fields,playeritems),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(playeritems,NewInfo);

update_data(quest_role,Object)->
	TermInfo=record_info(fields,quest_role),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(quest_role,NewInfo);

update_data(recharge1,Object)->
	TermInfo=record_info(fields,recharge1),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(recharge1,NewInfo);

update_data(role_activity_value,Object)->
	TermInfo=record_info(fields,role_activity_value),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_activity_value,NewInfo);

update_data(role_buy_log,Object)->
	TermInfo=record_info(fields,role_buy_log),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_buy_log,NewInfo);

update_data(role_buy_mall_item,Object)->
	TermInfo=record_info(fields,role_buy_mall_item),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_buy_mall_item,NewInfo);

update_data(role_chess_spirit_log,Object)->
	TermInfo=record_info(fields,role_chess_spirit_log),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_chess_spirit_log,NewInfo);

update_data(role_congratu_log,Object)->
	TermInfo=record_info(fields,role_congratu_log),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_congratu_log,NewInfo);

update_data(role_continuous_logging_info,Object)->
	TermInfo=record_info(fields,role_continuous_logging_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_continuous_logging_info,NewInfo);

update_data(role_designation_info,Object)->
	TermInfo=record_info(fields,role_designation_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_designation_info,NewInfo);

update_data(role_favorite_gift_info,Object)->
	TermInfo=record_info(fields,role_favorite_gift_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_favorite_gift_info,NewInfo);

update_data(role_festival_recharge_data,Object)->
	TermInfo=record_info(fields,role_festival_recharge_data),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_festival_recharge_data,NewInfo);

update_data(role_first_charge_gift,Object)->
	TermInfo=record_info(fields,role_first_charge_gift),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_first_charge_gift,NewInfo);

update_data(role_gold_exchange_info,Object)->
	TermInfo=record_info(fields,role_gold_exchange_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_gold_exchange_info,NewInfo);

update_data(role_instance,Object)->
	TermInfo=record_info(fields,role_instance),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_instance,NewInfo);

update_data(role_instance_quality,Object)->
	TermInfo=record_info(fields,role_instance_quality),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_instance_quality,NewInfo);

update_data(role_invite_friend_info,Object)->
	TermInfo=record_info(fields,role_invite_friend_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_invite_friend_info,NewInfo);

update_data(role_judge_left_num,Object)->
	TermInfo=record_info(fields,role_judge_left_num),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_judge_left_num,NewInfo);

update_data(role_judge_num,Object)->
	TermInfo=record_info(fields,role_judge_num),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_judge_num,NewInfo);

update_data(role_levelup_opt_record,Object)->
	TermInfo=record_info(fields,role_levelup_opt_record),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_levelup_opt_record,NewInfo);

update_data(role_login_bonus,Object)->
	TermInfo=record_info(fields,role_login_bonus),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_login_bonus,NewInfo);

update_data(role_loop_instance,Object)->
	TermInfo=record_info(fields,role_loop_instance),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_loop_instance,NewInfo);

update_data(role_loop_tower,Object)->
	TermInfo=record_info(fields,role_loop_tower),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_loop_tower,NewInfo);

update_data(role_lottery,Object)->
	TermInfo=record_info(fields,role_lottery),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_lottery,NewInfo);

update_data(role_mainline,Object)->
	TermInfo=record_info(fields,role_mainline),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_mainline,NewInfo);

update_data(role_mall_integral,Object)->
	TermInfo=record_info(fields,role_mall_integral),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_mall_integral,NewInfo);

update_data(role_quick_bar,Object)->
	TermInfo=record_info(fields,role_quick_bar),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_quick_bar,NewInfo);

update_data(role_service_activities_db,Object)->
	TermInfo=record_info(fields,role_service_activities_db),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_service_activities_db,NewInfo);

update_data(role_skill,Object)->
	TermInfo=record_info(fields,role_skill),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_skill,NewInfo);

update_data(role_timelimit_gift,Object)->
	TermInfo=record_info(fields,role_timelimit_gift),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_timelimit_gift,NewInfo);

update_data(role_treasure_storage,Object)->
	TermInfo=record_info(fields,role_treasure_storage),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_treasure_storage,NewInfo);

update_data(role_treasure_transport_db,Object)->
	TermInfo=record_info(fields,role_treasure_transport_db),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_treasure_transport_db,NewInfo);

update_data(role_venation,Object)->
	TermInfo=record_info(fields,role_venation),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_venation,NewInfo);

update_data(role_venation_advanced,Object)->
	TermInfo=record_info(fields,role_venation_advanced),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_venation_advanced,NewInfo);

update_data(role_welfare_activity_info,Object)->
	TermInfo=record_info(fields,role_welfare_activity_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(role_welfare_activity_info,NewInfo);

update_data(roleattr,Object)->
	TermInfo=record_info(fields,roleattr),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(roleattr,NewInfo);

update_data(signature,Object)->
	TermInfo=record_info(fields,signature),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(signature,NewInfo);

update_data(tangle_battle,Object)->
	TermInfo=record_info(fields,tangle_battle),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(tangle_battle,NewInfo);

update_data(tangle_battle_kill_info,Object)->
	TermInfo=record_info(fields,tangle_battle_kill_info),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(tangle_battle_kill_info,NewInfo);

update_data(tangle_battle_role_killnum,Object)->
	TermInfo=record_info(fields,tangle_battle_role_killnum),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(tangle_battle_role_killnum,NewInfo);

update_data(template_playeritems,Object)->
	TermInfo=record_info(fields,playeritems),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(template_playeritems,NewInfo);

update_data(vip_role,Object)->
	TermInfo=record_info(fields,vip_role),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(vip_role,NewInfo);

update_data(wing_role,Object)->
	TermInfo=record_info(fields,wing_role),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(wing_role,NewInfo);

update_data(game_rank_db,Object)->
	TermInfo=record_info(fields,game_rank_db),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(game_rank_db,NewInfo);

update_data(guild_monster,Object)->
	TermInfo=record_info(fields,guild_monster),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(guild_monster,NewInfo);

update_data(yhzq_battle_record,Object)->
	TermInfo=record_info(fields,yhzq_battle_record),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(yhzq_battle_record,NewInfo);

update_data(mall_up_sales_table,Object)->
	TermInfo=record_info(fields,mall_up_sales_table),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(mall_up_sales_table,NewInfo);

update_data(instance_pos,Object)->
	TermInfo=record_info(fields,instance_pos),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(instance_pos,NewInfo);

update_data(open_service_level_rank_db,Object)->
	TermInfo=record_info(fields,open_service_level_rank_db),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(open_service_level_rank_db,NewInfo);

%%丹药方面表
update_data(furnace,Object)->
	TermInfo=record_info(fields,furnace),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(furnace,NewInfo);
update_data(furnace_add_role_attribute,Object)->
	TermInfo=record_info(fields,furnace_add_role_attribute),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(furnace_add_role_attribute,NewInfo);

update_data(astrology_add_role_attribute,Object)->
	TermInfo=record_info(fields,astrology_add_role_attribute),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(astrology_add_role_attribute,NewInfo);

update_data(astrology_package,Object)->
	TermInfo=record_info(fields,astrology_package),
	ValueList = lists:nthtail(1, tuple_to_list(Object)),
	NewInfo=lists:zip(TermInfo, ValueList),
	update(astrology_package,NewInfo);

update_data(_,Object)->
	nothing.


%% 修改数据表(replace方式)
update(Table_name, Field_Value_List) ->
	[Where|_]=Field_Value_List,
	Sql = make_update_sql(Table_name, Field_Value_List,[Where]),
	execute(Sql).


make_update_sql(Table_name, Field_Value_List,Where_List) ->	
%%  db_sql:make_update_sql(player, 
%%                         [{status, 0}, {online_flag,1}, {hp,50, add}, {mp,30,sub}],
%%                         [{id, 11}]).
 	{Vsql, _Count1} =
		lists:mapfoldl(
	  		fun(Field_value, Sum) ->	
				Expr = case Field_value of
						 {Field, Val, add} -> io_lib:format("`~s`=`~s`+~p", [Field, Field, Val]);
						 {Field, Val, sub} -> io_lib:format("`~s`=`~s`-~p", [Field, Field, Val]);						 
						 {Field, Val} -> 
								if Val=:=undefined ->
										NewVal=[];
								true->
										NewVal=Val
								end,
									 case is_binary(NewVal) orelse is_list(NewVal)  orelse is_tuple(NewVal) orelse is_atom(NewVal)of 
								 true -> 
										if is_atom(NewVal)->
												 ["`", mysql_db_tool:to_list(Field),"`='",mysql_db_tool:get_sql_val(NewVal),"'"];
										   is_tuple(NewVal)->
												io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(NewVal))]);
											true->
												case mysql_db_tool:is_string(NewVal)of
													yes->
														if NewVal=:=[]->
															   io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(NewVal))]);
														   true->
																%io_lib:format("`~s`='~s'",[Field,auth_util:escape_uri(NewVal)])
																 io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(NewVal))])
														end;
													_->
														io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(NewVal))])
												end
										end;
							 	 _-> io_lib:format("`~s`=~p",[Field, NewVal])
							 end
					end,
				S1 = if Sum == length(Field_Value_List) -> io_lib:format("~s ",[Expr]);
						true -> io_lib:format("~s,",[Expr])
					 end,
 				{S1, Sum+1}
			end,
			1, Field_Value_List),
	{Wsql, Count2} = get_where_sql(Where_List),
	WhereSql = 
		if Count2 > 1 -> lists:concat(["where ", lists:flatten(Wsql)]);
	   			 true -> ""
		end,
	lists:concat(["update `", Table_name, "` set ",
	 			  lists:flatten(Vsql), WhereSql, ""
				 ]).


%% 执行一个SQL查询,返回影响的行数
execute(Sql) ->
    case mysql:fetch(?DB, Sql) of
        {updated, {_, _, _, R, _}} -> {ok};
        {error, {_, _, _, _, Reason}} -> mysql_halt([Sql, Reason])
    end.
execute(Sql, Args) when is_atom(Sql) ->
    case mysql:execute(?DB, Sql, Args) of
        {updated, {_, _, _, R, _}} -> {ok};
        {error, {_, _, _, _, Reason}} -> mysql_halt([Sql, Reason])
    end;
execute(Sql, Args) ->
    mysql:prepare(s, Sql),
    case mysql:execute(?DB, s, Args) of
        {updated, {_, _, _, R, _}} ->{ok};
        {error, {_, _, _, _, Reason}} -> mysql_halt([Sql, Reason])
    end.

%% @doc 显示人可以看得懂的错误信息
mysql_halt([Sql, Reason]) ->
    catch erlang:error({db_error, [Sql, Reason]}).

get_where_sql(Where_List) ->
%%  条件用列表方式：[{},{},{}]
%%  每一个条件形式(一共三种)：
%%		1、{idA, "<>", 10, "or"}   	<===> {字段名, 操作符, 值，下一个条件的连接符}
%% 	    2、{idB, ">", 20}   			<===> {idB, ">", 20，"and"}
%% 	    3、{idB, 20}   				<===> {idB, "=", 20，"and"}		
	lists:mapfoldl(
  		fun(Field_Operator_Val, Sum) ->	
			[Expr, Or_And_1] = 
				case Field_Operator_Val of   
					{Field, Operator, Val, Or_And} ->
								 case is_binary(Val) orelse is_list(Val)  orelse is_tuple(Val) orelse is_atom(Val)of 
								 true -> 
										if is_atom(Val)->
												ValueList=atom_to_list(Val),
												Result=io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(ValueList))]),
												[Result,Or_And];
										   is_tuple(Val)->
												Result=io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(Val))]),
												[Result,Or_And];
											true->
												%io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(NewVal))])
												Result=io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(Val))]),
												%auth_util:escape_uri(Result)
												[Result,Or_And]
										end;
							 	 _-> [io_lib:format("`~s`=~p",[Field, Val]),Or_And]
							 end;
					{Field, Operator, Val} ->
								 case is_binary(Val) orelse is_list(Val)  orelse is_tuple(Val) orelse is_atom(Val)of 
								 true -> 
										if is_atom(Val)->
												ValueList=atom_to_list(Val),
												[io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(ValueList))]),"and"];
										   is_tuple(Val)->
												[io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(Val))]),"and"];
											true->
												%io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(NewVal))])
												Result=io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(Val))]),
												%auth_util:escape_uri(Result)
												[Result,"and"]
										end;
							 	 _-> [io_lib:format("`~s`=~p",[Field, Val]),"and"]
							 end;
					{Field, Val} -> 
								if Val=:=undefined ->
										NewVal=[];
									true->
										NewVal=Val
								end,
								 case is_binary(NewVal) orelse is_list(NewVal)  orelse is_tuple(NewVal) orelse is_atom(NewVal)of 
								 true -> 
										if is_atom(NewVal)->
											 ["`", mysql_db_tool:to_list(Field),"`='",mysql_db_tool:get_sql_val(NewVal),"'"];
										   is_tuple(NewVal)->
												[io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(NewVal))]),"and"];
											true->
											case mysql_db_tool:is_string(NewVal)of
													yes->
														if NewVal=:=[]->
															   [io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(NewVal))]),"and"];
														   true->
																%[io_lib:format("`~s`='~s'",[Field,auth_util:escape_uri(NewVal)]),"and"]
																[io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(NewVal))]),"and"]
														end;
													_->
														[io_lib:format("`~s`='~s'",[Field,lists:flatten(io_lib:write(NewVal))]),"and"]
												end
										end;
							 	 _-> [io_lib:format("`~s`=~p",[Field, NewVal]),"and"]
							 end;
					 _-> ""
				   end,
			S1 = if Sum == length(Where_List) -> io_lib:format("~s ",[Expr]);
					true ->	io_lib:format("~s ~s ",[Expr, Or_And_1])
				 end,
			{S1, Sum+1}
		end,
		1, Where_List).











