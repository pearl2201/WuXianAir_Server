{application, role_app,
[{description,"ZY role server"},
 {vsn,"1.0"},
 {modules,[role_app,role_manager,role_sup,role_processor]},
 {registered,[role_manager,role_sup]},
 {applications,[kernel,stdlib]},
 {mod,{role_app,[]}}
 ]
}.