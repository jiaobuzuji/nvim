-- filetype configurations
-- Author: jiaobuzuji@163.com
-- Github: https://github.com/jiaobuzuji
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- options {1
-- vim.opt.wrap = true
-- vim.opt.spell = true
-- vim.bo.xxxx= true

-------------------------------------------------------------------------------
-- buffer keymap {1
local m = vim.api.nvim_buf_set_keymap
local opts = {noremap = true, silent = true}

m(0,'n','ZZ','ZZ<cmd>ccl<cr>',opts)
