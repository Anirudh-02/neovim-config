-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    -- or                            , tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-buffer"},
    {"saadparwaiz1/cmp_luasnip"},
    {"rafamadriz/friendly-snippets"},
  }
}
use {
  'nvim-treesitter/nvim-treesitter', tag = "v0.9.0",
  requires = { "JoosepAlviste/nvim-ts-context-commentstring"},
  run = ':TSUpdate'
}
use('tpope/vim-fugitive')
use("jose-elias-alvarez/null-ls.nvim")
use 'm4xshen/autoclose.nvim'
use 'lewis6991/gitsigns.nvim'
use 'nvim-tree/nvim-web-devicons'
use 'nvim-lualine/lualine.nvim'
use 'numToStr/Comment.nvim'
use "lukas-reineke/indent-blankline.nvim"
use "RRethy/vim-illuminate"
use "mrjones2014/nvim-ts-rainbow"
use "windwp/nvim-ts-autotag"
use 'nvim-tree/nvim-tree.lua'
use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    require"startup".setup()
  end
}
use 'echasnovski/mini.nvim'
use "rebelot/kanagawa.nvim"
use ('mg979/vim-visual-multi', {branch= 'master'})
use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
use 'bluz71/vim-moonfly-colors'
use 'rose-pine/neovim'
use { "catppuccin/nvim", as = "catppuccin" }
use 'nvim-treesitter/playground'
use 'Mofiqul/vscode.nvim'
use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
end)
