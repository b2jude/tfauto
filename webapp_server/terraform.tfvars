#variable release is initialized in environment variable TF_VAR_release
#release = "1.0"
#variable region is initialized in environment variable TF_VAR_region
#region = "us-east-1"
#variable webapp_appname is initialized in environment variable TF_VAR_webapp_appname
#webapp_appname= "webapp"
webapp_instanceport = 80
webapp_instanceprotocol = "HTTP"
webapp_lbport = 80
webapp_lbprotocol = "HTTP"
webapp_healthythreshold = 3
webapp_unhealthythreshold = 3
webapp_max_size = 1
webapp_min_size = 1
webapp_desirecapacity = 1
webapp_timeout = 20
webapp_interval = 30
webapp_instancetype = "t2.micro"