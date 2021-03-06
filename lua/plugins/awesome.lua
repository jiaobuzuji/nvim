-- Awesome Plugins
-- Author: jiaobuzuji@163.com
-- Github: https://github.com/jiaobuzuji
-------------------------------------------------------------------------------

local M = {}

local m = vim.api.nvim_set_keymap
local ns = {noremap = true, silent = true}
local g = vim.g

-------------------------------------------------------------------------------
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
  m('n','<leader>sc','<cmd>SSave<cr>',ns) -- creat
  m('n','<leader>sd','<cmd>SDelete<cr>',ns)
  -- m('n','<leader>sc','<cmd>SClose<cr>',ns)
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
-- yankring
M.yankring = function()
  g.yankring_history_dir = vim.fn.stdpath('data')
  g.yankring_window_height = 15
  m('n','<leader>oy','<cmd>YRShow<cr>',ns)
  m('n','Y',[[<cmd>YRYankCount 'y$'<cr>]],ns)
end

-------------------------------------------------------------------------------
-- which-key
M.whichkey = function()
  local wk = require("which-key")
  wk.setup{
    plugins = {
      -- marks = true, -- shows a list of your marks on ' and `
      -- registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {enabled = true}, -- how many suggestions should be shown in the list?
    },
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" , "v" }, -- fix conflict : m('i', 'vv', '<C-[><cmd>update<cr>', ns)
      v = { "j", "k" , "v" },
    },
  }
  wk.register({
    c = {name = "Comment"},
    f = {name = "FuzzyFind"},
    g = {name = "Git"},
    o = {name = "Others"},
    t = {name = "Terminal"},
    v = {name = "Find and Replace"},
    w = {name = "Windows"},
  }, { prefix = "<leader>" })
end

-------------------------------------------------------------------------------
-- align 
M.easyalign = function()
  m('n','ga','<Plug>(EasyAlign)',{silent=true})
  m('x','ga','<Plug>(EasyAlign)',{silent=true})
  g.easy_align_delimiters = {
    ['#'] = {
      pattern = '#',
      ignore_groups = {'String'},
    },
    ['/'] = {
      pattern         = [[//\+\|/\*\|\*/]],
      delimiter_align = "l",
      ignore_groups   = {'!Comment'},
    },
  }
end

-------------------------------------------------------------------------------
-- translator
M.translator = function()
  g.translator_default_engines = {'bing','youdao','haici'}
  -- m('n','<leader>ot','<Plug>TranslateW',{silent=true}) -- popup window
  -- m('v','<leader>ot','<Plug>TranslateWV',{silent=true})
  m('n','<leader>ot','<Plug>Translate',{silent=true})
  m('v','<leader>ot','<Plug>TranslateV',{silent=true})
  -- -- Replace the text with translation
  -- nmap <silent> <Leader>r <Plug>TranslateR
  -- vmap <silent> <Leader>r <Plug>TranslateRV
  -- nmap <silent> <Leader>x <Plug>TranslateX -- clipboard
end

-------------------------------------------------------------------------------
-- undotree
M.undotree = function()
  g.undotree_WindowLayout=2
  g.undotree_DiffpanelHeight=8
  g.undotree_SetFocusWhenToggle=1
  m('n','<leader>ou','<cmd>UndotreeToggle<cr>',ns)
  -- autocmd BufWritePre $VIMFILES/undodir/* set noundofile
  vim.cmd [[ autocmd FileType undotree setlocal rnu ]]
end

-------------------------------------------------------------------------------
M.ctrlsf = function()
  -- g.ctrlsf_regex_pattern = 1
  g.ctrlsf_default_root = 'project+ww'
  g.ctrlsf_extra_root_markers = {'.git','.svn'}
  g.ctrlsf_indent = 2
  g.ctrlsf_auto_focus = {at="start"}
  g.ctrlsf_confirm_save = 0
  g.ctrlsf_populate_qflist = 1 -- for Qfreplace
  -- g.ctrlsf_debug_mode = 1
  g.ctrlsf_ignore_dir = {'.git','.svn','.hg','node_modules'}
  g.ctrlsf_mapping = {
    open    = {"<cr>", "o", "<2-LeftMouse>"},
    openb   = "O",
    split   = "<m-o>",
    vsplit  = "",
    tab     = "t",
    tabb    = "T",
    popen   = "<m-p>",
    popenf  = "",
    quit    = "q",
    stop    = "<c-c>",
    ['next']= "<m-j>",
    prev    = "<m-k>",
    nfile   = "<c-n>",
    pfile   = "<c-p>",
    chgmode = "M",
    pquit   = "q",
    loclist = "",
    fzf     = "<m-f>",
  }
  -- let g:ctrlsf_extra_backend_args = {
    -- \ 'ag':'--ignore "*.[odODaA]" --ignore "*.out" --ignore "*.hex" --ignore "*.bin"
    -- \ --ignore "*.exe" --ignore "*.so" --ignore "*.dll"
    -- \ --ignore "cscope*"',
    -- \ 'rg':'-g "!*.[odODaA]" -g "!*.out" -g "!*.hex" -g "!*.bin"
    -- \ -g "!*.exe" -g "!*.so" -g "!*.dll"
    -- \ -g "!cscope*"'
    -- \ }

  m('v','<leader>vs','<Plug>CtrlSFVwordPath',{silent=true})
  m('v','<leader>vv','<Plug>CtrlSFVwordExec',{silent=true})
  m('n','<leader>vs','<Plug>CtrlSFPrompt',{})
  m('n','<leader>vv','<Plug>CtrlSFCwordExec',{silent=true})
  m('n','<leader>vV','<Plug>CtrlSFCCwordExec',{silent=true})
  m('n','<leader>vt','<cmd>CtrlSFToggle<cr>',ns)
  -- nnoremap <leader>vh :call ctrlsf#Search('-hidden '.expand('<cword>'))<cr>
  -- nnoremap <leader>vH :call ctrlsf#Search('-hidden -R \b'.expand('<cword>').'\b')<cr>
  -- current Direction
  -- nnoremap <leader>vd :call ctrlsf#Search(expand('<cword>').' .')<cr>
  -- nnoremap <leader>vD :call ctrlsf#Search('-R \b'.expand('<cword>').'\b'.' .')<cr>
end

M.far = function()
  g['far#source']='rg'
  g['far#enable_undo']=1
end

-------------------------------------------------------------------------------
M.easymotion = function()
  g.EasyMotion_startofline = 0
  g.EasyMotion_show_prompt = 0
  g.EasyMotion_verbose = 0
  m('','W','<Plug>(easymotion-lineforward)',{silent=true})
  m('','B','<Plug>(easymotion-linebackward)',{silent=true})
  m('n','<leader>jk','<Plug>(easymotion-prefix)',{silent=true})
  m('x','<leader>jk','<Plug>(easymotion-prefix)',{silent=true})
  m('o','<leader>jk','<Plug>(easymotion-prefix)',{silent=true})
  -- -- MultiWindow easymotion for word
  -- m('n','<leader>jw','<Plug>(easymotion-overwin-w)',{silent=true})
  -- m('x','<leader>jw','<Plug>(easymotion-bd-w)',{silent=true})
  -- m('o','<leader>jw','<Plug>(easymotion-bd-w)',{silent=true})
  -- Multi Input Find Motion:s
  m('n','<leader>js','<Plug>(easymotion-sn)',{silent=true})
  m('x','<leader>js','<Plug>(easymotion-sn)',{silent=true})
  m('o','<leader>js','<Plug>(easymotion-sn)',{silent=true})
  -- Multi Input Find Motion:t
  m('n','<leader>jt','<Plug>(easymotion-tn)',{silent=true})
  m('x','<leader>jt','<Plug>(easymotion-tn)',{silent=true})
  m('o','<leader>jt','<Plug>(easymotion-tn)',{silent=true})
  -- MultiWindow easymotion for line
  m('n','<leader>jl','<Plug>(easymotion-overwin-line)',{silent=true})
  m('x','<leader>jl','<Plug>(easymotion-bd-jk)',{silent=true})
  m('o','<leader>jl','<Plug>(easymotion-bd-jk)',{silent=true})
  -- MultiWindow easymotion for char
  m('n','<leader>jj','<Plug>(easymotion-overwin-f)',{silent=true})
  m('x','<leader>jj','<Plug>(easymotion-bd-f)',{silent=true})
  m('o','<leader>jj','<Plug>(easymotion-bd-f)',{silent=true})
end

-------------------------------------------------------------------------------
-- nerdtree
M.nerdtree_setup = function()
  g.NERDTreeShowLineNumbers=1 -- show line number
  g.NERDTreeWinPos='left' -- show nerdtree in the rigth side
  g.NERDTreeIgnore={[[\.py[cd]$]], [[\~$]], [[\.swo$]], [[\.swp$]], [[^\.git$]], [[^\.hg$]], [[^\.svn$]], [[\.bzr$]]}
  g.NERDTreeWinSize='80'
  g.NERDTreeShowBookmarks=1
  g.NERDTreeChDirMode=2
  g.NERDTreeQuitOnOpen=1
  g.NERDTreeMouseMode=2

  m('n','<leader>of','<cmd>NERDTreeFind<cr>',ns) -- find file
  m('n','<leader>oq','<cmd>let g:NERDTreeQuitOnOpen = g:NERDTreeQuitOnOpen ? 0 : 1<cr>',ns)
end

-------------------------------------------------------------------------------
-- nvimtree
M.nvimtree_setup = function()
  local tree_cb = require'nvim-tree.config'.nvim_tree_callback
  require('nvim-tree').setup {
    -- disable_netrw       = true,
    -- hijack_netrw        = true,
    -- open_on_setup       = false,
    -- ignore_ft_on_setup  = {},
    -- auto_close          = false,
    -- open_on_tab         = false,
    -- hijack_cursor       = false,
    update_cwd          = true,
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    -- diagnostics         = {
    --   enable = false,
    --   icons = {
    --     hint = "",
    --     info = "",
    --     warning = "",
    --     error = "",
    --   }
    -- },
    -- update_focused_file = {
    --   enable      = false,
    --   update_cwd  = true,
    --   ignore_list = {}
    -- },
    -- system_open = {
    --   cmd  = nil,
    --   args = {}
    -- },
    -- git = {
    --   enable = true,
    --   ignore = true,
    --   timeout = 500,
    -- },
    view = {
      width = '40%',
      height = 30,
      side = 'left',
      -- auto_resize = false,
      -- number = false,
      relativenumber = true,
      mappings = {
        custom_only = false,
        list = {
          { key = {"<m-l>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
          { key = "<m-h>",  cb = tree_cb("parent_node") },
          { key = "<m-l>",  cb = tree_cb("tabnew") },
        }
      }
    },
    -- filters = {
    --   dotfiles = false,
    --   custom = {}
    -- },
    -- trash = {
    --   cmd = "trash",
    --   require_confirm = true,
    -- }
  }
end

M.nvimtree = function()
  g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 0,
  }
  g.nvim_tree_icons = {
    default =        '',
    -- symlink =        '',
    -- git = {
      -- unstaged =     "✗",
      -- staged =       "✓",
      -- unmerged =     "",
      -- renamed =      "➜",
      -- untracked =    "★",
      -- deleted =      "",
    -- },
    -- folder = {
      -- arrow_open =   "",
      -- arrow_closed = "",
      -- default =      "",
      -- open =         "",
      -- empty =        "",
      -- empty_open =   "",
      -- symlink =      "",
      -- symlink_open = "",
    -- },
    -- lsp = {
      -- hint = "",
      -- info = "",
      -- warning = "",
      -- error = "",
    -- }
  }
  g.nvim_tree_git_hl = 1
  g.nvim_tree_highlight_opened_files = 1
  g.nvim_tree_quit_on_open = 1
  g.nvim_tree_group_empty = 1
  g.nvim_tree_respect_buf_cwd = 1

  -- m('n','<leader>of','<cmd>NvimTreeFocus<cr>',ns)
  m('n','<leader>oe','<cmd>NvimTreeToggle<cr>',ns) -- explorer
  m('n','<leader>of','<cmd>NvimTreeFindFileToggle<cr>',ns) -- find file
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
M.treesitter_setup = function()
  vim.opt.foldmethod='expr'
  vim.opt.foldexpr='nvim_treesitter#foldexpr()'
end
M.treesitter = function()
  require('nvim-treesitter.configs').setup {
    -- ensure_installed={ "lua","c","cpp","verilog",'json'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight={enable=true, disable={'verilog'}, use_languagetree=true, },
    incremental_selection = {enable = true },
    textobjects = { enable = true },
    indent={enable=true, disable={}},
    -- TODO vim-matchup
  }
end

-------------------------------------------------------------------------------
return M

