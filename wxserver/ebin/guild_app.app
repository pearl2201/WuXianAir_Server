{application, guild_app,
[{description,"ZY Game Guild"},
 {vsn,"1.0"},
 {modules,[guild_app,guild_manager,guild_manager_sup]},
 {registered,[guild_app,guild_manager,guild_manager_sup]},
 {applications,[kernel,stdlib]},
 {mod,{guild_app,[]}}
 ]
}.