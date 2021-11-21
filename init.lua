-- init.lua
-- Author: jiaobuzuji@163.com
-- Github: https://github.com/jiaobuzuji
-- Date:   2021 Aug 11
-------------------------------------------------------------------------------

-- mapleader
vim.g.mapleader=" "
vim.g.maplocalleader=','

-- disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript", "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers",
  "matchit",
  "tar", "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball", "vimballPlugin",
  "zip", "zipPlugin",
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- load options,mappings,plugins ...
require('options')
require('mappings')
require('plugins')

