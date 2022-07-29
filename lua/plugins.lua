local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
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
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'rafamadriz/friendly-snippets' }


  -- bufferline
  use {
    'akinsho/bufferline.nvim', tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- theme
  use 'morhetz/gruvbox'
  use ({ 'projekt0n/github-nvim-theme' })
  use {
    'dracula/vim',
    as = 'dracula',
  }
  use ({
    "catppuccin/nvim",
    as = "catppuccin"
  })

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
  -- use { 'liuchengxu/vista.vim' }
  use { 'simrat39/symbols-outline.nvim' }  -- vista alternative
  use { 'RRethy/vim-illuminate' }
  use { 'SmiteshP/nvim-navic' }

  -- git
  use { -- lua plugin
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release
  }

  -- python
  use { 'Vimjas/vim-python-pep8-indent' }

  -- markdown
  use { 'godlygeek/tabular' }
  use { 'plasticboy/vim-markdown' }
  use { "iamcco/markdown-preview.nvim" }

  -- ui
  use { 'lukas-reineke/indent-blankline.nvim' }
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

  -- latex
  use { 'lervag/vimtex' }

  -- myself plugin
  use { 'ccg1024/myplugin' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
