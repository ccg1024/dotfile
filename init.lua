-- init.vim migrate
-- the files for lua config
-- init.lua, lua/, plugin/
-- setting below is to import config file in lua/
require("keybindings")
require("settings")
require("plugins")
require("plugconfigs")
require("lsp")

