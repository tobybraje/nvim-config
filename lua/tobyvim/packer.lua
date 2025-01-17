-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine', config = function()
  vim.cmd('colorscheme rose-pine')
  end
  })
  use ('ThePrimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
	vim.cmd('MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}
use {'mfussenegger/nvim-dap'}
use {'mfussenegger/nvim-dap-python'}
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
use { "averms/black-nvim", run = ":UpdateRemotePlugins"}
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
use{"airblade/vim-gitgutter"}
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
use {
  'yetone/avante.nvim',
  requires = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'zbirenbaum/copilot.lua',
    {
      'HakonHarnes/img-clip.nvim',
      config = function()
        require('img-clip').setup()
      end
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      config = function()
        require('render-markdown').setup({
          file_types = { "markdown", "Avante" }
        })
      end
    }
  },
  config = function()
    require('copilot').setup()
    require('avante_lib').load()
    require('avante').setup()
  end
}
  end)


