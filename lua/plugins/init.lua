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
  -------------------------------------------------------------------------------
  use {'wbthomason/packer.nvim'} -- Packer can manage itself as an optional plugin

  -------------------------------------------------------------------------------
  -- theme
  use {"kyazdani42/nvim-web-devicons", opt=false}
  use {'Iron-E/nvim-highlite'} -- colorscheme template
  -- use {'projekt0n/github-nvim-theme', event='VimEnter *', config=function() require"github-theme".setup({ theme_style="dark_default", transparent=true, }) end, }
  -- use {'folke/tokyonight.nvim', event='VimEnter *', config=function() vim.g.tokyonight_style="night" vim.g.tokyonight_transparent=true vim.g.tokyonight_italic_functions=false vim.cmd[[colorscheme tokyonight]] end}
  -- use {'navarasu/onedark.nvim', event='VimEnter *', config=function() vim.g.onedark_style='warm' vim.g.onedark_transparent_background=true vim.g.onedark_toggle_style_keymap='<nop>' require'onedark'.setup() end}
  -- use {'NLKNguyen/papercolor-theme', event='VimEnter *', config=function() vim.g.PaperColor_Theme_Options={ theme={ default={ override={ color00={ '#080808', '232' }, linenumber_bg={ '#080808', '232' } } } } } end}
  use {'itchyny/lightline.vim',opt=false, config=function() require'plugins.awesome'.lightline() end}
  -- use {'Yggdroot/indentLine'}
  use {'lukas-reineke/indent-blankline.nvim', opt=false, config=function() require'plugins.awesome'.blankline() end}
  -- "famiu/feline.nvim",
  -- "akinsho/bufferline.nvim",
  -- "romgrk/barbar.nvim",
  -- "nvim-lualine/lualine.nvim",


  -------------------------------------------------------------------------------
  -- awesome
  use {"nvim-lua/plenary.nvim",opt=false}
  use {'tpope/vim-surround', opt=false} -- machakann/vim-sandwich
  -- use {'tpope/vim-repeat', opt=false} -- TODO
  use {'andymass/vim-matchup', opt=false}
  use {'windwp/nvim-autopairs', opt=false, config=function() require'nvim-autopairs'.setup{} end}
  use {'mg979/vim-visual-multi', opt=false} -- terryma/vim-multiple-cursors
  -- use {'sheerun/vim-polyglot', opt=false} -- TODO
  -- use {'vim-scripts/YankRing.vim', opt=false, config=function() require'plugins.awesome'.yankring() end} -- yank history
  use {"norcalli/nvim-colorizer.lua", ft={'lua','vim','css'}, config=function() require'colorizer'.setup() end}
  use {'mbbill/undotree', cmd='UndotreeToggle', setup=function() require'plugins.awesome'.undotree() end}
  -- use {'glacambre/firenvim'} -- Turn your browser¹ into a Neovim client
  -- use {"max397574/better-escape.nvim"}
  -- "rcarriga/nvim-notify",
  -- use {'liuchengxu/graphviz.vim'}
  use {'vim-scripts/DrawIt', cmd='DIstart'}
  use {'qpkorr/vim-renamer', cmd='Ren'}
  -- nvim-lua/popup.nvim
  -- kevinhwang91/nvim-bqf
  use {'akinsho/toggleterm.nvim'} -- terminal
  use {'junegunn/vim-easy-align', keys='<Plug>(EasyAlign)', setup=function() require'plugins.awesome'.easyalign() end}
  -- Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
  -- Plug 'skywind3000/asynctasks.vim'
  -- Plug 'skywind3000/asyncrun.vim'

  -------------------------------------------------------------------------------
  -- help me
  -- use {'ianva/vim-youdao-translater'}
  use {'voldikss/vim-translator',
    cmd={'Translate','TranslateX','TranslateW'},
    keys={'<Plug>Translate','<Plug>TranslateV'},
    setup=function() require'plugins.awesome'.translator() end
  }
  -- use {'yianwillis/vimcdoc'}
  -- use {'liuchengxu/vim-which-key'}
  use {'folke/which-key.nvim', opt=false, config=function() require'plugins.awesome'.whichkey() end}
  -- use {'junegunn/vim-peekaboo', opt=false} -- extends `"` and `@` in normal mode and `<CTRL-R>` in insert mode
  -- vim-signify
  use {'dstein64/vim-startuptime',cmd='StartupTime'}

  -------------------------------------------------------------------------------
  -- project and startup
  -- use {'glepnir/dashboard-nvim'} -- TODO
  use {'mhinz/vim-startify',opt=false, config=function() require'plugins.awesome'.startify() end}
  -- "ahmedkhalf/project.nvim",


  -------------------------------------------------------------------------------
  -- Find and Replace
  -- dkprice/vim-easygrep
  use {'mhinz/vim-grepper',
    cmd={'Grepper'},
    keys={}, --TODO
    -- setup=function() require'plugins.awesome'.grepper() end
  }
  use {"brooth/far.vim",cmd={'Far', 'Fardo'}, config=function() require'plugins.awesome'.far() end}
  use {'dyng/ctrlsf.vim',
    cmd={'CtrlSF','CtrlSFToggle'},
    keys={'<Plug>CtrlSFVwordPath', '<Plug>CtrlSFVwordExec', '<Plug>CtrlSFPrompt', '<Plug>CtrlSFCwordExec', '<Plug>CtrlSFCCwordExec',},
    setup=function() require'plugins.awesome'.ctrlsf() end
  }
  use {'thinca/vim-qfreplace', cmd='Qfreplace'}


  -------------------------------------------------------------------------------
  -- Comment
  -- use {"terrortylor/nvim-comment"}
  use {'preservim/nerdcommenter', opt=false, config=function() require'plugins.awesome'.comment() end}
  -- use {'tomtom/tcomment_vim'}
  -- "numToStr/Comment.nvim",


  -------------------------------------------------------------------------------
  -- Plug 'pechorin/any-jump.vim'
  -- phaazon/hop.nvim
  -- justinmk/vim-sneak
  use {'easymotion/vim-easymotion',
    keys={'<Plug>(easymotion-lineforward)', '<Plug>(easymotion-linebackward)', '<Plug>(easymotion-prefix)',
      '<Plug>(easymotion-overwin-w)', '<Plug>(easymotion-overwin-line)', '<Plug>(easymotion-overwin-f)', '<Plug>(easymotion-sn)', '<Plug>(easymotion-tn)', '<Plug>(easymotion-bd-jk)', '<Plug>(easymotion-bd-f)',
    },
    setup=function() require'plugins.awesome'.easymotion() end
  }


  -------------------------------------------------------------------------------
  -- Files Explorer
  -- shougo/defx.nvim
  -- weirongxu/coc-explorer
  use {'preservim/nerdtree',
    cmd='NERDTreeFind',
    setup=function() require'plugins.awesome'.nerdtree_setup() end,
  }

  -- -- kevinhwang91/rnvimr -- ranger, Explorer
  -- use {"kyazdani42/nvim-tree.lua",
  --   cmd={'NvimTreeFindFile','NvimTreeFindFileToggle',"NvimTreeToggle", "NvimTreeFocus"},
  --   setup=function() require'plugins.awesome'.nvimtree() end,
  --   config=function() require'plugins.awesome'.nvimtree_setup() end
  -- }


  -------------------------------------------------------------------------------
  -- Taglist TODO
  -- Plug 'liuchengxu/vista.vim'
  -- matze/vim-move


  -------------------------------------------------------------------------------
  -- git
  -- vim-gitgutter
  -- use {'tpope/vim-fugitive'}
  -- use {'kdheepak/lazygit.nvim'}
  use {"lewis6991/gitsigns.nvim",
    opt=false,
    config=function()
      require'gitsigns'.setup {
        keymaps={
            -- Default keymap options
            buffer=true,
            noremap=true,
            ["n ]c"]={ expr=true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
            ["n [c"]={ expr=true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
            ["n <leader>gs"]='<cmd>lua require"gitsigns".stage_hunk()<CR>',
            ["n <leader>gu"]='<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
            ["n <leader>gr"]='<cmd>lua require"gitsigns".reset_hunk()<CR>',
            ["n <leader>gp"]='<cmd>lua require"gitsigns".preview_hunk()<CR>',
            ["n <leader>gb"]='<cmd>lua require"gitsigns".blame_line()<CR>',
        },
        numhl=false,
        sign_priority=5,
        signs={
            add={ hl="DiffAdd", text="│", numhl="GitSignsAddNr" },
            change={ hl="DiffChange", text="│", numhl="GitSignsChangeNr" },
            changedelete={ hl="DiffChange", text="~", numhl="GitSignsChangeNr" },
            delete={ hl="DiffDelete", text="_", numhl="GitSignsDeleteNr" },
            topdelete={ hl="DiffDelete", text="‾", numhl="GitSignsDeleteNr" },
        },
        status_formatter=nil, -- Use default
        watch_gitdir={
            interval=100,
        },
      }
    end,
  }


  -------------------------------------------------------------------------------
  -- treesitter
  -- use {'nvim-treesitter/playground', cmd='TSHighlightCaptureUnderCursor',
  --   config=function() require'xxx'.setup() end,
  -- } TODO
  use {'nvim-treesitter/nvim-treesitter',
    event="BufRead",
    setup=function() require'plugins.awesome'.treesitter_setup() end,
    config=function() require'plugins.awesome'.treesitter() end,
  }


  -------------------------------------------------------------------------------
  -- fuzzy finder
  -- junegunn/fzf
  -- use {"junegunn/fzf.vim",opt=false}
  -- yggdroot/leaderF
  -- liuchengxu/vim-clap
  -- nvim-telescope/telescope-frecency.nvim
  -- nvim-telescope/telescope-project.nvim
  use {"nvim-telescope/telescope.nvim",
    module="telescope",
    cmd="Telescope",
    requires={
      {"nvim-telescope/telescope-fzf-native.nvim",run="make" },
      {"nvim-telescope/telescope-media-files.nvim"},
    },
    setup=function() require'plugins.finder'.keymap() end,
    config=function() require'plugins.finder'.setup() end,
  }


  -------------------------------------------------------------------------------
  -- lsp dap
  -- neoclide/coc.nvim
  use {'RRethy/vim-illuminate',opt=false}
  use {"neovim/nvim-lspconfig",
    -- event="BufRead",
    ft={'lua','vim','verilog','systemverilog','c','cpp','json'},
    config=function() require'plugins.lspconfig' end,
  }
  -- use {'glepnir/lspsaga.nvim'} -- TODO
  use {'williamboman/nvim-lsp-installer'}

  -- "mfussenegger/nvim-dap",
  -- "Pocco81/DAPInstall.nvim",

  -- Complete,  Snippet
  use {"rafamadriz/friendly-snippets"} -- lsp snippet format
  -- use {'honza/vim-snippets', event={"InsertEnter"}} -- snipMate & UltiSnip Snippets 
  -- For luasnip users. TODO
  use {"L3MON4D3/LuaSnip"}
  use {"saadparwaiz1/cmp_luasnip",after='nvim-cmp'}
  -- -- For ultisnips users.
  -- Plug 'SirVer/ultisnips'
  -- Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  -- -- For snippy users.
  -- Plug 'dcampos/nvim-snippy'
  -- Plug 'dcampos/cmp-snippy'
  -- -- For vsnip users.
  -- use {'hrsh7th/vim-vsnip'}
  -- use {'hrsh7th/cmp-vsnip', after='nvim-cmp'}
  -- use {'hrsh7th/vim-vsnip-integ'}
  use {"hrsh7th/nvim-cmp", event={"InsertEnter",'CmdlineEnter'},  config=function() require'plugins.cmp'.setup() end}
  use {"hrsh7th/cmp-nvim-lsp", after='nvim-cmp'} -- lsp source
  use {"hrsh7th/cmp-nvim-lua", after='cmp-nvim-lsp'} -- neovim built-in api source
  use {"hrsh7th/cmp-buffer", after='cmp-nvim-lua'} -- buffer source
  use {"hrsh7th/cmp-path", after='cmp-buffer'} -- path source
  use {"hrsh7th/cmp-cmdline", after='cmp-path'} -- cmdline source
  -- Other source
  -- use {'hrsh7th/cmp-omni', after='cmp-path'}
  -- use {'hrsh7th/cmp-git', after='cmp-path'}
  -- use {'hrsh7th/cmp-look', after='cmp-path'}


  -------------------------------------------------------------------------------
  -- markdown latex
  -- plasticboy/vim-markdown
  use {'iamcco/markdown-preview.nvim',
    -- cmd={'MarkdownPreviewToggle','MarkdownPreview', 'MarkdownPreviewStop'}, -- fail for 'mkdp#util#install()'
    ft='markdown',
    run=':call mkdp#util#install()', -- run='cd app && yarn install'}
    -- setup=function() vim.g.mkdp_browser='firefox' vim.g.mkdp_port=8787 end,
  }
  -- lervag/vimtex

  -------------------------------------------------------------------------------
  -- Verilo Systemverilog
  use {'vhda/verilog_systemverilog.vim'}
  -- * Omni completion.
  -- * Configurable syntax folding.
  -- * Matchit settings to support Verilog 2001 and SystemVerilog.
  -- * Error format definitions for common Verilog tools.
  -- * Commands for code navigation.
  -- dense-analysis/ale
  -- steveicarus/iverilog
  -- chipsalliance/verible
  -- https://github.com/verilator/verilator
  -- suoto/hdl_checker
  -- dalance/svlint
  -- dalance/svls
  -- dalance/sv-parser
  -- sgherbst/svinst
  -- imc-trading/svlangserver


--------------------------------------------------------
end)

