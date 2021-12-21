" verilog instance {1
vnoremap <silent> <c-F4> :s#^\s*\(input\\|output\)\(\s\+\(wire\\|reg\)\)\?\s*\(\[.\{-1,}\]\s*\)\?#.<CR>gv:s#^\s*\(\/\/.*\)#    \1#e<CR>gv:s#^\.\(\<\w\+\>\)\(\s*\)#    .\1\2   (\1\2   )<CR>


