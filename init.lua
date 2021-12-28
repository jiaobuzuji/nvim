-- Vim basic configurations
-- Author: jiaobuzuji@163.com
-- Github: https://github.com/jiaobuzuji
-- Date:   2021 Aug 11
-------------------------------------------------------------------------------
-- vim:fdm=marker fmr={,}

-------------------------------------------------------------------------------
-- mapleader -- {1
vim.g.mapleader=" " -- <Space>
vim.g.maplocalleader=';'

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
-- }

-------------------------------------------------------------------------------
-- options -- {1
local opt = vim.opt -- vim.o
--  2 moving around, searching and patterns {2
opt.whichwrap:append "<>[]hl" -- list of flags specifying which commands wrap to another line
opt.startofline = true -- many jump commands move the cursor to the first non-blank
opt.ignorecase = true -- ignore case when using a search pattern
opt.smartcase = true -- override 'ignorecase' when pattern has upper case characters

--  3 tags {2
--  4 displaying text {2
opt.scrolloff = 5 -- number of screen lines to show around the cursor
opt.sidescrolloff = 5 -- minimal number of columns to keep left and right of the cursor
opt.wrap = false -- long lines wrap

-- opt.fillchars = { eob = " " } -- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
opt.lazyredraw = true -- don't redraw while executing macros
opt.list = true -- show <Tab> as ^I and end-of-line as $
opt.listchars = "tab:> ,extends:>,precedes:<,nbsp:.,trail:-" -- list of strings used for list mode
opt.relativenumber = true -- show the relative line number for each line

--  5 syntax, highlighting and spelling {2
opt.background = "dark" -- "dark" or "light"; the background color brightness
opt.termguicolors = true -- use GUI colors for the terminal
opt.cursorline = true -- highlight the screen line of the cursor
-- opt.spell = true -- highlight spelling mistakes

--  6 multiple windows {2
opt.winminheight = 0 -- minimal number of lines used for any window
opt.splitbelow = true -- a new window is put below the current one
opt.splitright = true -- a new window is put right of the current one

--  7 multiple tab pages {2
--  8 terminal {2
opt.title = true -- show info in the window title
opt.icon = true -- set the text of the icon for this window

--  9 using the mouse {2
opt.mouse = "a" -- list of flags for using the mouse

-- 10 printing {2
-- 11 messages and info {2
opt.report = 0 -- threshold for reporting number of changed lines
opt.confirm = true  -- start a dialog when a command fails
opt.helplang = "en,cn" -- list of preferred languages for finding help

-- 12 selecting text {2
opt.clipboard = 'unnamed,unnamedplus' -- "unnamed" to use the * register like unnamed register

-- 13 editing text {2
opt.undofile = true -- automatically save and restore undo history
opt.showmatch = true -- when inserting a bracket, briefly jump to its match
opt.matchtime = 2 -- tenth of a second to show a match for 'showmatch'
opt.completeopt = "menuone,preview,noselect" -- whether to use a popup menu for Insert mode completion

-- 14 tabs and indenting {2
opt.tabstop = 2 -- number of spaces a <Tab> in the text stands for
opt.shiftwidth = 2 -- number of spaces used for each step of (auto)indent
opt.softtabstop = 2 -- if non-zero, number of spaces to insert for a <Tab>
opt.shiftround = true --	round to 'shiftwidth' for "<<" and ">>"
opt.expandtab = true -- expand <Tab> to spaces in Insert mode
opt.smartindent = true -- do clever autoindenting
opt.cindent = true -- enable specific indenting for C code

-- 15 folding {2
opt.foldenable = false --	unset to display all folds open
opt.foldopen = "block,hor,insert,jump,mark,percent,quickfix,search,tag,undo" -- specifies for which commands a fold will be opened
opt.foldmethod = "syntax" -- folding type: "manual", "indent", "expr", "marker", "syntax" or "diff"

-- 16 diff mode {2
opt.diffopt:append "vertical" -- options for using diff mode

-- 17 mapping {2
opt.timeoutlen = 650 -- time in msec for 'timeout'
opt.ttimeoutlen = 50 -- time in msec for 'ttimeout'

-- 18 reading and writing files {2
opt.fileformats = "unix,dos,mac" -- list of file formats to look for when editing a file
opt.writebackup = false -- write a backup file before overwriting a file
opt.autowrite = true -- automatically write a file when leaving a modified buffer
opt.autoread = true -- automatically read a file when it was modified outside of Vim

-- 19 the swap file {2
-- 20 command line editing {2
opt.wildignore = "*.swp,*.bak,*.jpg,*.png,*.gif" -- list of patterns to ignore files for file name completion
opt.wildignorecase = true -- ignore case when completing file names

-- 21 executing external commands {2
-- 22 running make and jumping to errors (quickfix) {2
-- 23 system specific {2
-- 24 language specific {2
-- 25 multi-byte characters {2
opt.encoding = "utf-8" -- character encoding used in Nvim: "utf-8"
opt.fileencoding = "utf-8" -- character encoding for the current file
opt.ambiwidth = 'single' -- width of ambiguous width characters

-- 26 various {2
opt.virtualedit = "block" -- when to use virtual editing: "block", "insert", "all" and/or "onemore"
opt.sessionoptions = "curdir,unix,slash,tabpages,terminal,winsize,resize"
opt.viewoptions = "cursor,unix,slash" -- Better Unix / Windows compatibility
opt.signcolumn = "yes" -- whether to show the signcolumn


-------------------------------------------------------------------------------
-- mappings {1
local m = vim.api.nvim_set_keymap
local ns = {noremap = true, silent = true}

-- misc
m('n',',',':',{noremap = true}) -- save finger
m('x',',',':',{noremap = true}) -- save finger
m('n','Q','gq',ns) -- Don't use Ex mode, use Q for formatting.  Revert with ":unmap Q".
-- m('n','Y','y$',ns) -- neovim default keymapping
-- m('i','<c-u>','<c-g>u<c-u>',ns) -- CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
-- m('i','<c-w>','<c-g>u<c-w>',ns) -- neovim default keymapping
m('n','<leader>/','<cmd>nohlsearch<cr>',ns)
m('n','tt','o<space><c-u><c-[>',ns) -- Insert new line in normal mode
m('v','p','"_dP',ns) -- Don't copy the replaced text after pasting in visual mode
m('v','<','<gv',ns) -- Reselect visual block after indent/outdent.
m('v','>','>gv',ns)
m('v','*',[[y/<c-r>=escape(@",'\\/.*$^~[]')<cr><cr>]],ns) -- m('v','*',"y/<c-r>=escape(@\",'\\\\/.*$^~[]')<cr><cr>",ns)
m('v','#',[[y?<c-r>=escape(@",'\\/.*$^~[]')<cr><cr>]],ns) -- m('v','#',"y?<c-r>=escape(@\",'\\\\/.*$^~[]')<cr><cr>",ns)
-- 'Save' and 'Esc'
m('i', 'jj', '<c-[>',            ns)
m('n', 'vv', '<cmd>update<cr>',      ns)
m('x', 'vv', '<C-C><cmd>update<cr>', ns)
m('i', 'vv', '<C-[><cmd>update<cr>', ns)
-- replace
m('n','<leader>ss',':%s/<c-r>//',{noremap=true})
m('v','<leader>ss',':s/<c-r>//',{noremap=true})
-- Quit Vim
m('n','<leader>ww','<cmd>qa<cr>',ns) -- windowS delete
m('n','<leader>wd','<c-w>q',ns) -- window delete
m('n','<leader>wh','<c-w>h',ns)
m('n','<leader>wl','<c-w>l',ns)
m('n','<leader>wj','<c-w>j',ns)
m('n','<leader>wk','<c-w>k',ns)
-- tab,windows, cursor move
m('n','<leader>1','1gt',ns)
m('n','<leader>2','2gt',ns) -- tab 2
m('n','<leader>3','3gt',ns)
m('n','<leader>4','4gt',ns)
m('n','<leader>5','5gt',ns)
m('n','<leader>6','6gt',ns)
m('n','<leader>7','7gt',ns)
m('n','<leader>8','8gt',ns)
m('n','<leader>9','9gt',ns)
m('n','<m-h>','8h',ns)
m('n','<m-l>','8l',ns) -- faster scroll
m('n','<m-j>','8j',ns)
m('n','<m-k>','8k',ns)
m('x','<m-h>','8h',ns)
m('x','<m-l>','8l',ns) -- faster scroll
m('x','<m-j>','8j',ns)
m('x','<m-k>','8k',ns)
m('i','<m-h>','<left>',ns)
m('i','<m-l>','<right>',ns)
m('i','<m-j>','<down>',ns)
m('i','<m-k>','<up>',ns)
m('i','<c-a>','<c-o>^',ns) -- jump to "start"
m('i','<c-x><c-a>','<c-a>',ns)
m('i','<c-e>',[[col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<lt>c-e>":"\<lt>end>"]],{noremap=true, silent=true, expr=true}) -- jump to "end"
m('c','<m-h>','<s-left>',{noremap=true}) -- jump word
m('c','<m-l>','<s-right>',{noremap=true})
m('c','<m-k>','<up>',{noremap=true})
m('c','<m-j>','<down>',{noremap=true})
m('c','<c-a>','<home>',{noremap=true}) -- jump to "start"
m('c','<c-x><c-a>','<c-a>',{noremap=true})
m('c','<c-b>','<left>',{noremap=true}) -- Emacs like
m('c','<c-f>','<right>',{noremap=true})
m('c','<c-p>','<up>',{noremap=true}) -- <up> instead of c_CTRL-P
m('c','<c-n>','<down>',{noremap=true}) -- <down> instead of c_CTRL-N
-- terminal
-- m('n','<leader>tt','<cmd>tab terminal<cr>',ns) -- open terminal-emulator fail
m('n','<leader>ts','<cmd>vsplit<cr><cmd>terminal<cr>',ns) -- open terminal-emulator
m('t','<m-h>','<c-left>',ns) -- jump word
m('t','<m-l>','<c-right>',ns)
m('t','<m-k>','<up>',ns)
m('t','<m-j>','<down>',ns)
m('t','<m-v><m-v>',[[<c-\><c-n>]],ns) -- leave terminal-mode


-- usr TODO
-- Format Current File
m('n','<c-f3>',[[:set ff=unix<CR>:%s/\s\+$//<CR>']],ns)


-------------------------------------------------------------------------------
-- autocmd {1
local cmd = vim.cmd
-- Add Packer commands because we are not loading it at startup
cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"


-------------------------------------------------------------------------------
-- colorscheme
vim.cmd 'colorscheme highlite'

-------------------------------------------------------------------------------
require 'plugins' -- tmp TODO FIXME
require('packer').compile()

