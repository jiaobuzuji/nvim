" verilog instance {1
vnoremap <silent> <c-F4> :s#^\s*\(input\\|output\)\(\s\+\(wire\\|reg\)\)\?\s*\(\[.\{-1,}\]\s*\)\?#.<CR>gv:s#^\s*\(\/\/.*\)#    \1#e<CR>gv:s#^\.\(\<\w\+\>\)\(\s*\)#    .\1\2   (\1\2   )<CR>

lua require('nvim-autopairs').remove_rule("'")
lua require('nvim-autopairs').remove_rule("`")

let b:verilog_indent_modules = 1

" vcs
" list of formats for error messages
set errorformat =%EError-\[%.%\\+\]\ %m
set errorformat+=%C%m\"%f\"\\,\ %l%.%#
set errorformat+=%C%f\\,\ %l
set errorformat+=%C%\\s%\\+%l:\ %m\\,\ column\ %c
set errorformat+=%C%\\s%\\+%l:\ %m
set errorformat+=%C%m\"%f\"\\,%.%#
set errorformat+=%Z%p^                      "Column pointer
set errorformat+=%C%m                       "Catch all rule
set errorformat+=%Z                         "Error message end on empty line

" Warning level formats
set errorformat+=%WWarning-\[%.%\\+]\\$
set errorformat+=%-WWarning-[LCA_FEATURES_ENABLED]\ Usage\ warning    "Ignore LCA enabled warning
set errorformat+=%WWarning-\[%.%\\+\]\ %m

" Lint level formats
set errorformat+=%I%tint-\[%.%\\+\]\ %m

" set makeprg = make

