{application, auth_app,
[{description,"ZY auth server"},
 {vsn,"1.0"},
 {modules,[auth_app,auth_sup,auth_processor,auth_db,gmauth_processor,gmauth_db]},
 {registered,[auth_app,auth_sup,auth_processor,auth_db,gmauth_processor,gmauth_db]},
 {applications,[kernel,stdlib]},
 {mod,{auth_app,[]}}
 ]
}.