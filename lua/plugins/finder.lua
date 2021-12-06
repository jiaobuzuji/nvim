-- Awesome Plugins
-- Author: jiaobuzuji@163.com
-- Github: https://github.com/jiaobuzuji
-------------------------------------------------------------------------------

local M = {}

local m = vim.api.nvim_set_keymap
local ns = {noremap = true, silent = true}
local g = vim.g

M.setup = function()
  require('telescope').setup {
    defaults = {
      vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
      -- selection_strategy = "reset",
      sorting_strategy = "ascending",
      -- layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
      },
      color_devicons = true,
    },
  }
end

M.keymap = function()
-- nnoremap <leader><leader> :Files<cr>
-- nnoremap <leader>fk :History:<cr>
-- nnoremap <leader>f/ :History/<cr>
-- nnoremap <leader>fh :History<cr>
-- nnoremap <leader>fb :Buffers<cr>
-- nnoremap <leader>fr :Rg<cr>
-- nnoremap <leader>fs :Snippets<cr>
-- nnoremap <leader>fw :Windows<cr>
-- nnoremap <leader>fm :Marks<cr>
-- nnoremap <leader>fl :Lines<cr>
-- nnoremap <leader>ft :Tags<cr>
-- nnoremap <leader>fc :Commands<cr>
-- nnoremap <leader>fgc :Commits<cr>
-- nnoremap <leader>fgf :GFiles<cr>
-- nnoremap <leader>ff  :FzfFunky<cr>
-- " nnoremap <leader>fmp :Maps<cr>
-- " nnoremap <leader>fht :Helptags<cr>
-- nnoremap <leader>fd  :call <SID>fzfrun_dir()<cr>

  m('n','<leader><leader>','<cmd>Telescope<cr>',ns)
end

-- return
return M

