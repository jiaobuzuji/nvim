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
  -- use {'projekt0n/github-nvim-theme', event='VimEnter *', config=function() require("github-theme").setup({ theme_style="dark_default", transparent=true, }) end, }
  -- use {'folke/tokyonight.nvim', event='VimEnter *', config=function() vim.g.tokyonight_style="night" vim.g.tokyonight_transparent=true vim.g.tokyonight_italic_functions=false vim.cmd[[colorscheme tokyonight]] end}
  -- use {'navarasu/onedark.nvim', event='VimEnter *', config=function() -- vim.g.onedark_style='warm' vim.g.onedark_transparent_background=true vim.g.onedark_toggle_style_keymap='<nop>' require('onedark').setup() end}
  -- use {'NLKNguyen/papercolor-theme', event='VimEnter *', config=function() vim.g.PaperColor_Theme_Options={ theme={ default={ override={ color00={ '#080808', '232' }, linenumber_bg={ '#080808', '232' } } } } } vim.cmd[[colorscheme PaperColor]] end}
  use {'Iron-E/nvim-highlite'} -- colorscheme template
  use {'itchyny/lightline.vim',opt=false, config=function() require'plugins.awesome'.lightline() end}
  -- use {'Yggdroot/indentLine'}
  use {'lukas-reineke/indent-blankline.nvim', opt=false, config=function() require'plugins.awesome'.blankline() end}


  -------------------------------------------------------------------------------
  -- translator
  -- use {'ianva/vim-youdao-translater'}
  use {'voldikss/vim-translator',
    cmd={'TranslateW'},
    keys={'<Plug>TranslateW','<Plug>TranslateWV'},
    setup=function() require'plugins.awesome'.translator() end
  }
  -- use {'yianwillis/vimcdoc'}


  -------------------------------------------------------------------------------
  -- awesome
  use {"nvim-lua/plenary.nvim",opt=false}
  use {'glepnir/dashboard-nvim'} -- TODO
  use {'mhinz/vim-startify',opt=false, config=function() require'plugins.awesome'.startify() end}
  use {'tpope/vim-surround', opt=false}
  use {'andymass/vim-matchup', opt=false}
  use {'windwp/nvim-autopairs', opt=false, config=function() require('nvim-autopairs').setup{} end}
  use {'mg979/vim-visual-multi'} -- TODO
  -- use {'sheerun/vim-polyglot', opt=false} -- TODO
  -- use {'vim-scripts/YankRing.vim', opt=false, config=function() require'plugins.awesome'.yankring() end} -- yank history
  use {'junegunn/vim-peekaboo', opt=false} -- extends `"` and `@` in normal mode and `<CTRL-R>` in insert mode
  use {"norcalli/nvim-colorizer.lua", ft={'lua','vim','css'}, config=function() require("colorizer").setup() end}
  use {'mbbill/undotree', cmd='UndotreeToggle', setup=function() require'plugins.awesome'.undotree() end}


  -------------------------------------------------------------------------------
  -- Find and Replace
  -- Plug 'thinca/vim-qfreplace'
  -- dkprice/vim-easygrep
  -- mhinz/vim-grepper
  use {"brooth/far.vim",cmd={'F', 'Far', 'Fardo'}, config=function() require'plugins.awesome'.far() end}
  use {'dyng/ctrlsf.vim',
    cmd={'CtrlSF','CtrlSFToggle'},
    keys={'<Plug>CtrlSFVwordPath', '<Plug>CtrlSFVwordExec', '<Plug>CtrlSFPrompt', '<Plug>CtrlSFCwordExec', '<Plug>CtrlSFCCwordExec',},
    setup=function() require'plugins.awesome'.ctrlsf() end
  }


  -------------------------------------------------------------------------------
  -- Comment
  -- use {"terrortylor/nvim-comment"}
  use {'preservim/nerdcommenter', opt=false, config=function() require'plugins.awesome'.comment() end}
  -- use {'tomtom/tcomment_vim'}

  -------------------------------------------------------------------------------
  -- Plug 'pechorin/any-jump.vim'
  use {'easymotion/vim-easymotion',
    keys={'<Plug>(easymotion-lineforward)', '<Plug>(easymotion-linebackward)'},
    setup=function() require'plugins.awesome'.easymotion() end
  }


  -------------------------------------------------------------------------------
  -- Files Explorer
  -- use {'preservim/nerdtree', cmd='NERDTreeFind'}
  use {"kyazdani42/nvim-tree.lua",
    cmd={ "NvimTreeToggle", "NvimTreeFocus" },
    setup=function() require'plugins.awesome'.nvimtree() end,
    config=function() require'plugins.awesome'.nvimtree_setup() end
  }


  -------------------------------------------------------------------------------
  -- markdown
  -- use {'iamcco/markdown-preview.nvim', cmd='MarkdownPreview', run='cd app && yarn install'}

  -- Taglist TODO
  -- Plug 'liuchengxu/vista.vim'

  -- Plug 'junegunn/vim-easy-align' " {1 TODO
  -- Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
  -- matze/vim-move
  -- Plug 'skywind3000/asynctasks.vim'
  -- Plug 'skywind3000/asyncrun.vim'

  -------------------------------------------------------------------------------
  -- git
  use {"lewis6991/gitsigns.nvim",
    opt=false,
    config=function()
      require("gitsigns").setup {
        keymaps={
            -- Default keymap options
            buffer=true,
            noremap=true,
            ["n ]c"]={ expr=true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
            ["n [c"]={ expr=true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
            ["n <leader>hs"]='<cmd>lua require"gitsigns".stage_hunk()<CR>',
            ["n <leader>hu"]='<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
            ["n <leader>hr"]='<cmd>lua require"gitsigns".reset_hunk()<CR>',
            ["n <leader>hp"]='<cmd>lua require"gitsigns".preview_hunk()<CR>',
            ["n <leader>hb"]='<cmd>lua require"gitsigns".blame_line()<CR>',
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
  -- Plug 'nvim-treesitter/playground'
  use {'nvim-treesitter/nvim-treesitter',
    event="BufRead",
    setup=function() require'plugins.awesome'.treesitter_setup() end,
    config=function() require'plugins.awesome'.treesitter() end,
  }


  -------------------------------------------------------------------------------
  -- lsp dap
  use {"neovim/nvim-lspconfig",
    event="BufRead",
    ft={'lua','vim','systemverilog','c','cpp','json'},
    config=function()
      require('plugins.lspconfig')
    end,
  }
  use {'glepnir/lspsaga.nvim'}

  -- Complete,  snippet
  use {"rafamadriz/friendly-snippets", event="InsertEnter"}
  use {"hrsh7th/nvim-cmp", after="friendly-snippets",
    config=function()
      local cmp=require'cmp'
      cmp.setup({
        snippet={
            expand=function(args)
              require("luasnip").lsp_expand(args.body)
            end,
        },
        -- formatting={
        --     format=function(entry, vim_item)
        --       -- load lspkind icons
        --       vim_item.kind=string.format(
        --           "%s %s",
        --           require("plugins.configs.lspkind_icons").icons[vim_item.kind],
        --           vim_item.kind
        --       )
        --       vim_item.menu=({
        --           nvim_lsp="[LSP]",
        --           nvim_lua="[Lua]",
        --           buffer="[BUF]",
        --       })[entry.source.name]
        --       return vim_item
        --     end,
        -- },
        mapping={
            ["<C-p>"]=cmp.mapping.select_prev_item(),
            ["<C-n>"]=cmp.mapping.select_next_item(),
            ["<C-d>"]=cmp.mapping.scroll_docs(-4),
            ["<C-f>"]=cmp.mapping.scroll_docs(4),
            ["<C-Space>"]=cmp.mapping.complete(),
            ["<C-e>"]=cmp.mapping.close(),
            ["<CR>"]=cmp.mapping.confirm {
              behavior=cmp.ConfirmBehavior.Replace,
              select=true,
            },
            ["<Tab>"]=function(fallback)
              if cmp.visible() then
                  cmp.select_next_item()
              -- elseif require("luasnip").expand_or_jumpable() then
              --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
              else
                  fallback()
              end
            end,
            ["<S-Tab>"]=function(fallback)
              if cmp.visible() then
                  cmp.select_prev_item()
              -- elseif require("luasnip").jumpable(-1) then
              --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
              else
                  fallback()
              end
            end,
        },
        sources={
            { name="nvim_lsp" },
            { name="luasnip" },
            { name="buffer" },
            { name="nvim_lua" },
            { name="path" },
        },
      })
      -- `/` cmdline setup.
      cmp.setup.cmdline('/', {
        sources={
          { name='buffer' }
        }
      })
      -- -- `:` cmdline setup.
      -- cmp.setup.cmdline(':', {
      --   sources=cmp.config.sources({
      --     { name='path' }
      --   }, {
      --     { name='cmdline' }
      --   })
      -- })
      -- local capabilities=require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    end,
  } -- TODO
  use {"hrsh7th/cmp-nvim-lsp", after="nvim-cmp"}
  use {"hrsh7th/cmp-buffer", after="cmp-nvim-lsp"}
  use {"hrsh7th/cmp-path", after="cmp-buffer"}
  use {'hrsh7th/cmp-vsnip', after='cmp-path'}
  use {'hrsh7th/vim-vsnip', after='cmp-vsnip'}
  -- use {'hrsh7th/cmp-yank', after='cmp-vsnip'} TODO

  -------------------------------------------------------------------------------
  -- fuzzy finder
  -- junegunn/fzf
  -- junegunn/fzf.vim
  -- yggdroot/leaderF
  use {"nvim-telescope/telescope.nvim",
    module="telescope",
    cmd="Telescope",
    requires={
      {"nvim-telescope/telescope-fzf-native.nvim",run="make" }, -- TODO windows make
      {"nvim-telescope/telescope-media-files.nvim"},
    },
    setup=function() require('plugins.finder').keymap() end,
    config=function() require('plugins.finder').setup() end,
  }

--------------------------------------------------------
end)

