# lua-config-loader

A simple configuration loader for Lua.

# Usage

```
local Config = require "config"
local config = Config()
```

```
local configValues = config:loadEnvironmentVariables({
    'OAUTH2_IP',
    'OAUTH2_PORT',
    'POSTGRES_IP',
    'POSTGRES_PORT',
    'POSTGRES_DATABASE',
    'POSTGRES_USER',
    'POSTGRES_PASSWORD'
})
```
   
or 

```
local configValues = config:parse(PATH_TO_CONFIG_FILE)
```

# Contribute

* Fork it the repository
* Create your feature branch (git checkout -b my-new-feature)
* Commit your changes (git commit -am 'Add some feature')
* Push to the branch (git push origin my-new-feature)
* Create a new Pull Request