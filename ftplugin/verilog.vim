" verilog instance {1
vnoremap <silent> <c-F4> :s#^\s*\(input\\|output\)\(\s\+\(wire\\|reg\)\)\?\s*\(\[.\{-1,}\]\s*\)\?#.<CR>gv:s#^\s*\(\/\/.*\)#    \1#e<CR>gv:s#^\.\(\<\w\+\>\)\(\s*\)#    .\1\2   (\1\2   )<CR>

lua require('nvim-autopairs').remove_rule("'")
lua require('nvim-autopairs').remove_rule("`")

let b:verilog_indent_modules = 1

" let g:verilog_spyglass
if (exists("g:verilog_spyglass"))
  "------------------------------------------------------------------------------------
  " spyglass
  " Error level formats
  setlocal errorformat =%.%#\ %\\+%tATAL\ %\\+%[a-zA-Z0-9]%\\+\ %\\+%f\ %\\+%l\ %\\+%n\ %\\+%m
  setlocal errorformat+=%.%#\ %\\+%tRROR\ %\\+%[a-zA-Z0-9]%\\+\ %\\+%f\ %\\+%l\ %\\+%n\ %\\+%m
  setlocal errorformat+=%.%#\ %\\+Syntax\ %\\+%f\ %\\+%l\ %\\+%m
  " Warning level formats
  setlocal errorformat+=%.%#\ %\\+%tARNING\ %\\+%[a-zA-Z0-9]%\\+\ %\\+%f\ %\\+%l\ %\\+%n\ %\\+%m
  " keymapping
  nnoremap <buffer><silent> <f5> <cmd>cd lint<cr><cmd>make<cr><cmd>cd ..<cr><cmd>cw<cr>
else
  "------------------------------------------------------------------------------------
  " vcs
  " list of formats for error messages
  setlocal errorformat =%EError-\[%.%\\+\]\ %m
  setlocal errorformat+=%C%m\"%f\"\\,\ %l%.%#
  setlocal errorformat+=%C%f\\,\ %l
  setlocal errorformat+=%C%\\s%\\+%l:\ %m\\,\ column\ %c
  setlocal errorformat+=%C%\\s%\\+%l:\ %m
  setlocal errorformat+=%C%m\"%f\"\\,%.%#
  setlocal errorformat+=%Z%p^                      "Column pointer
  setlocal errorformat+=%C%m                       "Catch all rule
  setlocal errorformat+=%Z                         "Error message end on empty line
  " Warning level formats
  setlocal errorformat+=%WWarning-\[%.%\\+]\\$
  setlocal errorformat+=%-WWarning-[LCA_FEATURES_ENABLED]\ Usage\ warning    "Ignore LCA enabled warning
  setlocal errorformat+=%WWarning-\[%.%\\+\]\ %m
  " Lint level formats
  setlocal errorformat+=%I%tint-\[%.%\\+\]\ %m
  " keymapping
  nnoremap <buffer><silent> <f5> <cmd>cd sim<cr><cmd>make<cr><cmd>cd ..<cr><cmd>cw<cr>
endif


" "------------------------------------------------------------------------------------
" " iverilog
" " Error level formats
" set errorformat=%f\\:%l:\ %m

"------------------------------------------------------------------------------------
" set makeprg = make

