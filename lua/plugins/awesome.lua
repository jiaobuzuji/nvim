-- Awesome Plugins
-- Author: jiaobuzuji@163.com
-- Github: https://github.com/jiaobuzuji
-------------------------------------------------------------------------------

local M = {}

local m = vim.api.nvim_set_keymap
local ns = {noremap = true, silent = true}
local g = vim.g

-- vim-startify
M.startify = function()
  g.startify_lists = {
    {type='sessions',  header={'   Sessions; [b]uffer, [s]plit, [v]ertical, [t]ab'}},
    {type='files',     header={'   MRU; Uppercase of b/s/v/t enable the batchmode.'}},
    {type='dir',       header={'   MRU; [e]mpty, [q]uit; '.. vim.fn.getcwd()}},
    {type='bookmarks', header={'   Bookmarks'}},
    {type='commands',  header={'   Commands' }},
  }
  g.startify_files_number = 5
  g.startify_change_to_dir = 1
  g.startify_change_to_vcs_root = 0
  g.startify_custom_header = {}
  g.startify_session_sort = 1
  g.startify_session_persistence = 1
  g.startify_enable_special = 0 -- Show <empty buffer> and <quit>.
  m('n','<leader>sl','<cmd>Startify<cr>',ns)
  m('n','<leader>ss','<cmd>SSave<cr>',ns)
  m('n','<leader>sd','<cmd>SDelete<cr>',ns)
  m('n','<leader>sc','<cmd>SClose<cr>',ns)
end

-- undotree
M.undotree = function()
  g.undotree_WindowLayout=2
  g.undotree_DiffpanelHeight=8
  g.undotree_SetFocusWhenToggle=1
  m('n','<leader>tu','<cmd>UndotreeToggle<cr>',ns)
  -- autocmd BufWritePre $VIMFILES/undodir/* set noundofile
  vim.cmd [[ autocmd FileType undotree setlocal rnu ]]
end

-- nvimtree
M.nvimtree = function()
end

-- comment
M.comment = function()
end

-- -- treesitter
-- M.treesitter = function()
-- end

-- return
return M

