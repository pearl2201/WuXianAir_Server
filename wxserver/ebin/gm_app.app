{application, gm_app,
[{description,"ZY gm Gate"},
 {vsn,"1.0"},
 {modules,[gm_app,gm_listener,gm_listener_sup,gm_acceptor_sup,gm_acceptor,gm_client_sup,gm_client]},
 {registered,[gm_listener,gm_listener_sup,gm_acceptor_sup]},
 {applications,[kernel,stdlib]},
 {mod,{gm_app,[]}}
 ]
}.