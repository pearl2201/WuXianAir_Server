-ifndef(_scribe_types_included).
-define(_scribe_types_included, yeah).
-include("fb303_types.hrl").


-define(scribe_ResultCode_OK, 0).
-define(scribe_ResultCode_TRY_LATER, 1).

-record(logEntry, {category, message}).

-endif.
