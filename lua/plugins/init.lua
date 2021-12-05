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
  -- opt = true
  use {'wbthomason/packer.nvim'} -- Packer can manage itself as an optional plugin
  use {'yianwillis/vimcdoc'}
  use {'Iron-E/nvim-highlite'} -- colorscheme template

  -- theme
  -- use {'projekt0n/github-nvim-theme', event='VimEnter *', config=function() require("github-theme").setup({ theme_style="dark_default", transparent=true, }) end, }
  -- use {'folke/tokyonight.nvim', event='VimEnter *', config=function() vim.g.tokyonight_style="night" vim.g.tokyonight_transparent=true vim.g.tokyonight_italic_functions=false vim.cmd[[colorscheme tokyonight]] end, }
  -- use {'navarasu/onedark.nvim', event='VimEnter *', config=function() -- vim.g.onedark_style='warm' vim.g.onedark_transparent_background=true vim.g.onedark_toggle_style_keymap='<nop>' require('onedark').setup() end, }
  -- use {'NLKNguyen/papercolor-theme', event='VimEnter *', config=function() vim.g.PaperColor_Theme_Options={ theme={ default={ override={ color00={ '#080808', '232' }, linenumber_bg={ '#080808', '232' } } } } } vim.cmd[[colorscheme PaperColor]] end, }

  -- awesome
  use {'mhinz/vim-startify',opt=false, config = function() require('plugins.awesome').startify() end}
  use {'tpope/vim-surround', opt=false}
  use {'andymass/vim-matchup', opt=false}
  -- use {"terrortylor/nvim-comment"}
  use {'preservim/nerdcommenter', opt=false, config = function() require('plugins.awesome').comment() end}
  use {'windwp/nvim-autopairs', opt=false, config = function() require('nvim-autopairs').setup{} end}
  use {"norcalli/nvim-colorizer.lua", ft = {'lua','vim'}, config = function() require("colorizer").setup() end}
  use {'mbbill/undotree', cmd = 'UndotreeToggle', setup=function() require('plugins.awesome').undotree() end}

  use {"kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    setup = function() require('plugins.awesome').nvimtree() end,
    config = function() require('plugins.awesome').nvimtree_setup() end,
  }
  use {"nvim-lua/plenary.nvim",opt=false}

  -- use {'iamcco/markdown-preview.nvim', cmd = 'MarkdownPreview', run = 'cd app && yarn install'}

  -- treesitter
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

  -- lsp dap
  use {"neovim/nvim-lspconfig"}

  -- Complete,  snippet
  use {"rafamadriz/friendly-snippets", event = "InsertEnter"}
  use {"hrsh7th/nvim-cmp", after = "friendly-snippets"}
  use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
  use {"hrsh7th/cmp-buffer", after = "cmp-nvim-lsp"}
  use {"hrsh7th/cmp-path", after = "cmp-buffer"}

  -- fuzzy finder
  use {"nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    requires = {
      {"nvim-telescope/telescope-fzf-native.nvim",run="make" },
      {"nvim-telescope/telescope-media-files.nvim",},
    },
    setup = function() require('plugins.finder').setup() end
  }

--------------------------------------------------------
end)

