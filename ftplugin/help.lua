-- filetype configurations
-- Author: jiaobuzuji@163.com
-- Github: https://github.com/jiaobuzuji
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- buffer keymap {1
local m = vim.api.nvim_buf_set_keymap
local opts = {noremap = true, silent = true}
m(0,'n','q','<c-w>q',opts)

