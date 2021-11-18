-- Vim options setting
-- Author: jiaobuzuji@163.com
-- Github: https://github.com/jiaobuzuji
-------------------------------------------------------------------------------
-- vim:fdm=marker fmr={,}

local opt = vim.opt
--  2 moving around, searching and patterns {1
opt.whichwrap:append "<>[]hl" -- list of flags specifying which commands wrap to another line
opt.startofline = true -- many jump commands move the cursor to the first non-blank
opt.ignorecase = true -- ignore case when using a search pattern
opt.smartcase = true -- override 'ignorecase' when pattern has upper case characters

--  3 tags {1
--  4 displaying text {1
opt.scrolloff = 5 -- number of screen lines to show around the cursor
opt.sidescrolloff = 5 -- minimal number of columns to keep left and right of the cursor
-- opt.fillchars = { eob = " " } -- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
opt.lazyredraw = true -- don't redraw while executing macros
opt.list = true -- show <Tab> as ^I and end-of-line as $
opt.listchars = "tab:> ,extends:>,precedes:<,nbsp:.,trail:-" -- list of strings used for list mode
opt.relativenumber = true -- show the relative line number for each line

--  5 syntax, highlighting and spelling {1
opt.cursorline = true -- highlight the screen line of the cursor
opt.spell = true -- highlight spelling mistakes

--  6 multiple windows {1
opt.winminheight = 0 -- minimal number of lines used for any window
opt.splitbelow = true -- a new window is put below the current one
opt.splitright = true -- a new window is put right of the current one

--  7 multiple tab pages {1
--  8 terminal {1
--  9 using the mouse {1
opt.mouse = "a" -- list of flags for using the mouse

-- 10 printing {1
-- 11 messages and info {1
opt.report = 0 -- threshold for reporting number of changed lines
opt.helplang = "en,cn" -- list of preferred languages for finding help

-- 12 selecting text {1
opt.clipboard = "unnamedplus" -- "unnamed" to use the * register like unnamed register

-- 13 editing text {1
opt.undofile = true -- automatically save and restore undo history
opt.showmatch = true -- when inserting a bracket, briefly jump to its match
opt.matchtime = 2 -- tenth of a second to show a match for 'showmatch'

-- 14 tabs and indenting {1
opt.tabstop = 2 -- number of spaces a <Tab> in the text stands for
opt.shiftwidth = 2 -- number of spaces used for each step of (auto)indent
opt.softtabstop = 2 -- if non-zero, number of spaces to insert for a <Tab>

-- 15 folding {1
-- 16 diff mode {1
-- 17 mapping {1
-- 18 reading and writing files {1
-- 19 the swap file {1
-- 20 command line editing {1
-- 21 executing external commands {1
-- 22 running make and jumping to errors (quickfix) {1
-- 23 system specific {1
-- 24 language specific {1
-- 25 multi-byte characters {1
-- 26 various {1


-- opt.cul = true -- cursor line

-- -- Indentline
-- opt.expandtab = options.expandtab
-- opt.shiftwidth = options.shiftwidth
-- opt.smartindent = options.smartindent

-- opt.ignorecase = options.ignorecase
-- opt.smartcase = options.smartcase

-- -- Numbers
-- opt.number = options.number
-- opt.numberwidth = options.numberwidth
-- opt.relativenumber = options.relativenumber
-- opt.ruler = options.ruler

-- -- disable nvim intro
-- opt.shortmess:append "sI"

-- opt.signcolumn = "yes"
-- opt.splitbelow = true
-- opt.splitright = true
-- opt.tabstop = options.tabstop
-- opt.timeoutlen = options.timeoutlen
-- opt.undofile = options.undofile

-- -- interval for writing swap file to disk, also used by gitsigns
-- opt.updatetime = options.updatetime

-- opt.whichwrap:append "<>[]hl"


