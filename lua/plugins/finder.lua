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
      file_ignore_patterns = { "node_modules" },
      -- selection_strategy = "reset",
      sorting_strategy = "ascending",
      -- layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
      },
      mappings = {
        i = {
          ["<esc>"] = require('telescope.actions').close,
          ["<m-j>"] = require('telescope.actions').move_selection_next,
          ["<m-k>"] = require('telescope.actions').move_selection_previous,
          ["<m-n>"] = require('telescope.actions').cycle_history_next,
          ["<m-p>"] = require('telescope.actions').cycle_history_prev,
        },
      },
      color_devicons = true,
    },
  }
end

M.keymap = function()
-- nnoremap <leader>fgc :Commits<cr>
-- nnoremap <leader>fgf :GFiles<cr>
-- nnoremap <leader>ff  :FzfFunky<cr>
-- " nnoremap <leader>fmp :Maps<cr>

  m('n','<c-p>','<cmd>Telescope<cr>',ns) -- CtrlP
  -- m('n','<leader><leader>','<cmd>Telescope find_files<cr>',ns)
  -- m('n','<leader><leader>','<cmd>Telescope fd<cr>',ns) -- fastest find -- conflict 'witch-key' plugin
  m('n','<leader>ff','<cmd>Telescope fd<cr>',ns) -- fastest find
  m('n','<leader>fi','<cmd>Telescope fd no_ignore=true}<cr>',ns) -- include "ignore" files
  m('n','<leader>fh','<cmd>Telescope fd hidden=true<cr>',ns) -- include "hidden" files
  m('n','<leader>fk','<cmd>Telescope command_history<cr>',ns)
  m('n','<leader>f/','<cmd>Telescope search_history<cr>',ns)
  m('n','<leader>fl','<cmd>Telescope current_buffer_fuzzy_find<cr>',ns) -- curren buffer line
  m('n','<leader>ftb','<cmd>Telescope current_buffer_tags<cr>',ns) -- buffer tags
  m('n','<leader>fth','<cmd>Telescope help_tags<cr>',ns) -- help tags
  m('n','<leader>fm','<cmd>Telescope marks<cr>',ns)
  m('n','<leader>fs','<cmd>Telescope treesitter<cr>',ns)
  m('n','<leader>fo','<cmd>Telescope oldfiles<cr>',ns)
  m('n','<leader>fb','<cmd>Telescope buffers<cr>',ns)
  -- m('n','<leader>fr','<cmd>Telescope grep_string<cr>',ns)
  m('n','<leader>fr','<cmd>Telescope live_grep<cr>',ns) -- grep on the fly
  m('n','<leader>fw','<cmd>Telescope registers<cr>',ns) -- word
  m('n','<leader>fx','<cmd>Telescope quickfix<cr>',ns)
  m('n','<leader>fe','<cmd>Telescope file_browser<cr>',ns) -- Explorer
  m('n','<leader>fc','<cmd>Telescope commands<cr>',ns)
end

-- return
return M

