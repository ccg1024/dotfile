local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'hoob3rt/lualine.nvim'


  -- lsp
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

  -- icons
  use 'onsails/lspkind.nvim'
  use 'nvim-tree/nvim-web-devicons'


  -- some tool
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-commentary' }
  use { "windwp/nvim-autopairs" }
  use 'norcalli/nvim-colorizer.lua'
  use { 'phaazon/hop.nvim', branch = 'v1', }
  use { 'simrat39/symbols-outline.nvim' } -- vista alternative
  use { 'RRethy/vim-illuminate' }
  use { 'SmiteshP/nvim-navic' }

  -- git
  use { 'lewis6991/gitsigns.nvim', }

  -- python
  use { 'Vimjas/vim-python-pep8-indent' }

  -- markdown
  use { 'godlygeek/tabular' }
  use { 'plasticboy/vim-markdown' }
  use { "iamcco/markdown-preview.nvim" }

  -- ui
  -- use { 'lukas-reineke/indent-blankline.nvim' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- fuzzy finder
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use { 'nvim-telescope/telescope.nvim' }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- term
  use { "akinsho/toggleterm.nvim", tag = '*' }

  -- null-ls and formatting
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
end)
