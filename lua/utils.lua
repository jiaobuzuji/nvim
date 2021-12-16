-- Awesome Plugins
-- Author: jiaobuzuji@163.com
-- Github: https://github.com/jiaobuzuji
-------------------------------------------------------------------------------

local M = {}


local m = vim.api.nvim_set_keymap
local ns = {noremap = true, silent = true}
local g = vim.g

-------------------------------------------------------------------------------
M.getHLname = function()
  vim.cmd [[
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
  ]]
end

-------------------------------------------------------------------------------
return M
