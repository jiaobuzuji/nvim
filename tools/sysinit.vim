" Neovim environment for Windows
" Author: jiaobuzuji@163.com
" Github: https://github.com/jiaobuzuji
" Date:   2021 Aug 11
" Command: mklink sysinit.vim d:\repos\nvim.git\tools\sysinit.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $XDG_CONFIG_HOME='d:\repos'
let $XDG_DATA_HOME='d:\repos\nvim'

set runtimepath-=~\AppData\Local\nvim
set runtimepath-=~\AppData\Local\nvim\after
set runtimepath-=~\AppData\Local\nvim-data\site
set runtimepath-=~\AppData\Local\nvim-data\site\after
set packpath-=~\AppData\Local\nvim
set packpath-=~\AppData\Local\nvim\after
set packpath-=~\AppData\Local\nvim-data\site
set packpath-=~\AppData\Local\nvim-data\site\after

set runtimepath^=$XDG_CONFIG_HOME\nvim
set runtimepath+=$XDG_CONFIG_HOME\nvim\after
set runtimepath^=$XDG_DATA_HOME\nvim-data\site
set runtimepath+=$XDG_DATA_HOME\nvim-data\site\after
set packpath^=$XDG_CONFIG_HOME\nvim
" set packpath+=$XDG_CONFIG_HOME\nvim\after
set packpath^=$XDG_DATA_HOME\nvim-data\site
" set packpath+=$XDG_DATA_HOME\nvim-data\site\after

set directory=$XDG_DATA_HOME\nvim-data\swap//
set undodir=$XDG_DATA_HOME\nvim-data\undo//
set backupdir=$XDG_DATA_HOME\nvim-data\backup//
set viewdir=$XDG_DATA_HOME\nvim-data\view//

autocmd VimEnter * GuiFont! Hack Nerd Font Mono:h12
autocmd VimEnter * GuiTabline 0

