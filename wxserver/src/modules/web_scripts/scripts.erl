%%% -------------------------------------------------------------------
%%% 9������ȫ���״ο�Դ����
%%% http://www.9miao.com
%%% -------------------------------------------------------------------
-module(scripts).
-export([test/3]).


test(SessionID, Env, Input) ->
	[UidStr, MoneyStr] = string:tokens(Input, "&"),
	[UidLabel, Namestr] = string:tokens(UidStr, "="),
	[MoneyKey,Moneystr]=string:tokens(MoneyStr, "="),
	Name=list_to_binary(Namestr),
	Money=list_to_integer(Moneystr),
	role_recharge(Name,Money),
	Content = string:tokens(Input, "&") ++ "\r\n",
    mod_esi:deliver(SessionID,
        ["Content-Type: text/html\r\n\r\n" | Content]).
%%充值转到活动，活动在map2节点
role_recharge(Name,Money)->
	activity_manager:role_online_to_recharge(Name,Money).

format([]) ->
    "";
format([{Key, Value} | Env]) ->
    [io_lib:format("<b>~p:</b> ~p<br />\~n", [Key, Value]) | format(Env)].
