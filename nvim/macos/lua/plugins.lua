local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- icon
  use 'nvim-tree/nvim-web-devicons'

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

  -- theme
  use 'svrana/neosolarized.nvim'
  -- use 'navarasu/onedark.nvim'
  use 'sainnhe/gruvbox-material'

  -- for color
  use 'tjdevries/colorbuddy.nvim'

  -- some tool
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-commentary' }
  -- use { 'kshenoy/vim-signature' }
  use { "windwp/nvim-autopairs" }
  use 'norcalli/nvim-colorizer.lua'
  use { 'phaazon/hop.nvim', branch = 'v1', }
  -- highlight undercusor word
  use { 'RRethy/vim-illuminate' }

  -- git
  use { 'lewis6991/gitsigns.nvim', }

  -- python
  use { 'Vimjas/vim-python-pep8-indent' }

  -- markdown
  use { 'godlygeek/tabular' }
  use { 'plasticboy/vim-markdown' }
  use { "iamcco/markdown-preview.nvim" }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- fuzzy finder
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use { 'nvim-telescope/telescope.nvim' }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- term
  use { "akinsho/toggleterm.nvim", tag = '*' }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- highlight todo comment
  -- the search format is `todo:`
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
