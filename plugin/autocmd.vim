" Author: jiaobuzuji@163.com
" Github: https://github.com/jiaobuzuji
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" -------------------------------------------------------------------------------
" Put these in an autocmd group, so that you can revert them with:
" ":augroup vimStartup | au! | augroup END"
augroup vimStartup
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid, when inside an event handler
  " (happens when dropping a file on gvim) and for a commit message (it's
  " likely a different one than last time).
  autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif

  " highlight on yank
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}

  " terminal
  autocmd TermOpen * startinsert
augroup END

" -------------------------------------------------------------------------------
augroup edaGroup
  autocmd!
  autocmd BufRead,BufNewFile *.ucf,*.xdc, setlocal filetype=sdc
augroup END

