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
  -- theme
  use {'folke/tokyonight.nvim',
    event = 'VimEnter *',
    config = function()
      vim.g.tokyonight_style = "night"
      vim.g.tokyonight_italic_functions = true
      vim.cmd[[colorscheme tokyonight]]
    end,
  }

  -- use {'navarasu/onedark.nvim',
  --   event = 'VimEnter *',
  --   config = function()
  --     -- vim.g.onedark_style = 'warm'
  --     vim.g.onedark_italic_comment = false
  --     vim.g.onedark_toggle_style_keymap = '<nop>'
  --     require('onedark').setup()
  --   end,
  -- }
  -- awesome
  use {'andymass/vim-matchup', opt=false}
  use {'windwp/nvim-autopairs', opt=false}
  use {"norcalli/nvim-colorizer.lua",
    event = "BufRead",
    ft = {'lua','vim'}, -- vim config colors
    config = function()
      require("colorizer").setup()
    end,
  }
  -- lsp dap treesitter
  use {'nvim-treesitter/nvim-treesitter'}

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

