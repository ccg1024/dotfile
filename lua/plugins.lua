local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use 'kyazdani42/nvim-tree.lua'

  -- lsp
  use "williamboman/nvim-lsp-installer"
  use 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-jdtls'

  -- complete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- snips
  use {'SirVer/ultisnips',
      requires = {{'honza/vim-snippets', rtp = '.'}},
      config = function ()
        vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
        vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
        vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
        vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end
  }
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- theme
  use 'morhetz/gruvbox'
  use ({ 'projekt0n/github-nvim-theme' })

  -- some tool
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-commentary' }
  use { 'kshenoy/vim-signature' }
  use { "windwp/nvim-autopairs" }
  use 'norcalli/nvim-colorizer.lua'
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
  }

  -- git
  use { 'airblade/vim-gitgutter' }
  use { 'tpope/vim-fugitive' }

  -- python
  use { 'Vimjas/vim-python-pep8-indent' }

  -- markdown
  use { 'godlygeek/tabular' }
  use { 'plasticboy/vim-markdown' }
  use { "iamcco/markdown-preview.nvim" }

  -- ui
  use { 'lukas-reineke/indent-blankline.nvim' }
  use {
    'akinsho/bufferline.nvim', tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- fuzzy finder
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use { 'nvim-telescope/telescope.nvim' }
  use 'nvim-telescope/telescope-media-files.nvim'

  -- session
  use { 'tpope/vim-obsession' }

  -- term
  use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
    require("toggleterm").setup()
  end}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
