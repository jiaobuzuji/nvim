-- Awesome Plugins
-- Author: jiaobuzuji@163.com
-- Github: https://github.com/jiaobuzuji
-------------------------------------------------------------------------------

local M = {}

local m = vim.api.nvim_set_keymap
local ns = {noremap = true, silent = true}
local g = vim.g

-------------------------------------------------------------------------------
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

-------------------------------------------------------------------------------
M.lightline = function()
  g.lightline = {
    colorscheme='ayu_dark',
    active={
      left={{'mode','paste'},{'relativepath','modified'}},
      right={{'lineinfo'}, {'percent'}, {'filetype'}}
    },
    mode_map={
      -- n='N', i='I', R='R', v='V', V='VL', ["<C-v>"]='VB',
      -- c='C', s='S', S='SL', ["<C-s>"]='SB', t='T'
      n='N', i='I', R='R', v='V', V='VL', ['']='VB',
      c='C', s='S', S='SL', ['']='SB', t='T'
    },
  }
end

-------------------------------------------------------------------------------
-- yankring
M.yankring = function()
  g.yankring_history_dir = vim.fn.stdpath('data')
  g.yankring_window_height = 15
  m('n','<leader>ys','<cmd>YRShow<cr>',ns)
  m('n','Y',[[<cmd>YRYankCount 'y$'<cr>]],ns)
end
-------------------------------------------------------------------------------
-- translator
M.translator = function()
  g.translator_default_engines = {'bing','youdao','haici'}
  m('n','<leader>w','<Plug>TranslateW',{silent=true})
  m('v','<leader>w','<Plug>TranslateWV',{silent=true})
	-- -- Replace the text with translation
	-- nmap <silent> <Leader>r <Plug>TranslateR
	-- vmap <silent> <Leader>r <Plug>TranslateRV
  -- nmap <silent> <Leader>x <Plug>TranslateX
end

-------------------------------------------------------------------------------
-- undotree
M.undotree = function()
  g.undotree_WindowLayout=2
  g.undotree_DiffpanelHeight=8
  g.undotree_SetFocusWhenToggle=1
  m('n','<leader>tu','<cmd>UndotreeToggle<cr>',ns)
  -- autocmd BufWritePre $VIMFILES/undodir/* set noundofile
  vim.cmd [[ autocmd FileType undotree setlocal rnu ]]
end

-------------------------------------------------------------------------------
-- nvimtree
M.nvimtree_setup = function()
  require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    diagnostics         = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    git = {
      enable = true,
      ignore = true,
    },
    view = {
      width = 30,
      height = 30,
      side = 'left',
      auto_resize = false,
      number = false,
      relativenumber = true,
      mappings = {
        custom_only = false,
        list = {}
      }
    },
    filters = {
      dotfiles = false,
      custom = {}
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    }
  }
end

M.nvimtree = function()
  m('n','<leader>nf','<cmd>NvimTreeFocus<cr>',ns)
end


-------------------------------------------------------------------------------
M.blankline = function()
   require("indent_blankline").setup {
      indentLine_enabled = 1,
      char = "▏",
      filetype_exclude = {
         "help",
         "terminal",
         "dashboard",
         "packer",
         "lspinfo",
         "TelescopePrompt",
         "TelescopeResults",
      },
      buftype_exclude = { "terminal" },
      -- show_trailing_blankline_indent = false,
      show_first_indent_level = false,
   }
end

-------------------------------------------------------------------------------
-- comment
M.comment = function()
  g.NERDSpaceDelims=1
  g.NERDMenuMode=1
  -- g.NERDAltDelims_c = 1 -- default delimiter. Not work!! BUG!!!
  g.NERDCustomDelimiters = {c= {left='//', leftAlt='/*', rightAlt='*/'}}
  g.NERDAltDelims_dosbatch = 1
end

-------------------------------------------------------------------------------
-- -- treesitter
-- M.treesitter = function()
-- end

-- return
return M

