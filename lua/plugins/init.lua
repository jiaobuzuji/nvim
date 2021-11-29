-- Packer
-- Author: jiaobuzuji@163.com
-- Github: https://github.com/jiaobuzuji
-------------------------------------------------------------------------------

vim.cmd "packadd packer.nvim"
local packer = require('packer')
packer.init {
  opt_default = true, -- Default to using opt (as opposed to start) plugins
  git = {
    clone_timeout = 600, -- Timeout, in seconds, for git clones
    default_url_format = 'https://github.com.cnpmjs.org/%s' -- Lua format string used for "aaa/bbb" style plugins
  },
  auto_clean = true,
  compile_on_sync = true,
  -- auto_reload_compiled = true
}

return packer.startup(function()
  use {'wbthomason/packer.nvim'} -- Packer can manage itself as an optional plugin
  use {'yianwillis/vimcdoc'}
  use {'Iron-E/nvim-highlite'} -- colorscheme template

  -- theme
  -- use {'projekt0n/github-nvim-theme',
  --   event = 'VimEnter *',
  --   config = function()
  --     require("github-theme").setup({
  --       theme_style = "dark_default",
  --       transparent = true,
  --     })
  --   end,
  -- }
  -- use {'folke/tokyonight.nvim',
  --   event = 'VimEnter *',
  --   config = function()
  --     vim.g.tokyonight_style = "night"
  --     vim.g.tokyonight_transparent = true
  --     vim.g.tokyonight_italic_functions = false
  --     vim.cmd[[colorscheme tokyonight]]
  --   end,
  -- }
  -- use {'navarasu/onedark.nvim',
  --   event = 'VimEnter *',
  --   config = function()
  --     -- vim.g.onedark_style = 'warm'
  --     -- vim.g.onedark_italic_comment = false
  --     vim.g.onedark_transparent_background = true
  --     vim.g.onedark_toggle_style_keymap = '<nop>'
  --     require('onedark').setup() 
  --   end,
  -- }
  -- use {'NLKNguyen/papercolor-theme',
  --   event = 'VimEnter *',
  --   config = function()
  --     vim.g.PaperColor_Theme_Options = {
  --       theme = {
  --         default = {
  --           override = {
  --             color00 = { '#080808', '232' },
  --             linenumber_bg = { '#080808', '232' }
  --           }
  --         }
  --       }
  --     }
  --     vim.cmd[[colorscheme PaperColor]]
  --   end,
  -- }

  -- awesome
  use {'mhinz/vim-startify',opt=false,
    config = function()
      vim.g.startify_lists = {
          {type='sessions',  header={'   Sessions; [b]uffer, [s]plit, [v]ertical, [t]ab'}},
          {type='files',     header={'   MRU; Uppercase of b/s/v/t enable the batchmode.'}},
          {type='dir',       header={'   MRU; [e]mpty, [q]uit; '}},
          {type='bookmarks', header={'   Bookmarks'}},
          {type='commands',  header={'   Commands' }},
        }
      vim.g.startify_enable_special = 0 -- Show <empty buffer> and <quit>.
      vim.api.nvim_set_keymap('n','<leader>sl','<cmd>Startify<cr>',{noremap = true, silent = true})
      vim.api.nvim_set_keymap('n','<leader>ss','<cmd>SSave<cr>',{noremap = true, silent = true})
    end,
  }
  use {'andymass/vim-matchup',
    event = "BufRead",
  }
  use {'windwp/nvim-autopairs',
    event = "BufRead",
  }
  use {"norcalli/nvim-colorizer.lua",
    ft = {'lua','vim'}, -- vim config colors
    config = function()
      require("colorizer").setup()
    end,
  }
  -- lsp dap treesitter
  use {'nvim-treesitter/nvim-treesitter',
    event = "BufRead",
    config = function()
      require('nvim-treesitter.configs').setup {
        -- ensure_installed = { "lua","c","cpp","verilog"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
          enable = true,
          use_languagetree = true,
        },
      }
    end,
  }

  -- -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- -- Load on a combination of conditions: specific filetypes or commands
  -- -- Also run code after load (see the "config" key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }

  -- -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

end)

