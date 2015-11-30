package = "config-loader"
version = "0.0.1-0"
source = {
  url = "git://github.com/moltin/lua-config-loader",
  tag = "0.0.1"
}
description = {
  summary = "A simple configuration loader for Lua",
  detailed = [[
    A simple configuration loader for Lua, this module will load or configuration params from a file or from environment variables.
  ]],
  homepage = "https://github.com/moltin/lua-config-loader",
  license = "MIT"
}
dependencies = {
  "lua >= 5.1"
}
build = {
  type = "builtin",
  modules = {
    config = "src/config.lua"
  }
}