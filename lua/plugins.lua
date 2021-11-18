
  return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true} -- Packer can manage itself as an optional plugin

    -- Load on an autocommand event
    use {'andymass/vim-matchup', event = 'VimEnter *'}

    use {'nvim-treesitter/nvim-treesitter', opt = true}

    -- -- Lazy loading:
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

