--[[]]
vim.g["prettier#exec_cmd_path"] = "/opt/homebrew/bin/prettier"
--[[ local status_ok, prettier = pcall(require, "prettier") ]]
--[[]]
--[[ if not status_ok then ]]
--[[   return ]]
--[[ end ]]
--[[]]
--[[ prettier.setup{ ]]
--[[   autoformat = true, ]]
--[[   config_path = vim.loop.cwd() .. "/.prettierrcc" ]]
--[[ } ]]
--[[]]
--
--[[ package.path = package.path .. ';./node_modules/?.lua' ]]
--[[ require('prettier').setup({ ]]
--[[   autoformat = true, ]]
--[[   config_path = vim.loop.cwd() .. "/.prettierrc" ]]
--[[ }) ]]
--[[ local prettier = require('prettier') ]]
--[[ require("comment") ]]