{application, timer_center,
[{description,"ZY timer center application"},
 {vsn,"1.0"},
 {modules,[timer_app,timer_center,timer_sup]},
 {registered,[timer_center,timer_sup]},
 {applications,[kernel,stdlib]},
 {mod,{timer_app,[]}}
 ]
}.