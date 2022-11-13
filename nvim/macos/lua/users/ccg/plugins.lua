local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- use 'kyazdani42/nvim-tree.lua'
  -- icon
  use 'nvim-tree/nvim-web-devicons'

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
  -- use {
  --   'akinsho/bufferline.nvim', tag = "v2.*",
  --   requires = 'kyazdani42/nvim-web-devicons'
  -- }

  -- theme
  -- use 'morhetz/gruvbox'
  -- use({ 'projekt0n/github-nvim-theme' })
  -- use {
  --   'dracula/vim',
  --   as = 'dracula',
  -- }
  -- use({
  --   "catppuccin/nvim",
  --   as = "catppuccin"
  -- })
  -- use 'svrana/neosolarized.nvim'
  -- use 'navarasu/onedark.nvim'
  use 'sainnhe/gruvbox-material'

  -- for color
  use 'tjdevries/colorbuddy.nvim'

  -- some tool
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-commentary' }
  use { 'kshenoy/vim-signature' }
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
  use { 'lukas-reineke/indent-blankline.nvim' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- use {
  --   'goolord/alpha-nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  -- }

  -- fuzzy finder
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use { 'nvim-telescope/telescope.nvim' }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- session
  -- use { 'tpope/vim-obsession' }

  -- term
  use { "akinsho/toggleterm.nvim", tag = '*' }

  -- latex
  -- use { 'lervag/vimtex' }

  -- formatting
  -- use 'jose-elias-alvarez/null-ls.nvim'

  -- ranger
  -- use 'francoiscabrol/ranger.vim'
  -- use 'rbgrouleff/bclose.vim'

  -- myself plugin
  -- use { 'ccg1024/myplugin' }

  -- use({
  --   "folke/noice.nvim",
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- })

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
