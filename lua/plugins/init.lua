require("plugins.configs.cmp")
require("plugins.configs.telescope")
require("plugins.configs.treesitter")
require("plugins.configs.indent-blankline")
require("plugins.configs.lualine")
require("plugins.configs.impatient")
--require("plugins.configs.bufferline")
local fn = vim.fn
--automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

--autocommand that reload neovim whenever you save the plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

--------------------
-- Add Plug Start --
--------------------
-- Packer can manage itself
  use 'wbthomason/packer.nvim'
-- startup time show --
  use {
       'dstein64/vim-startuptime',
        cmd = "StartupTime"
  }
-- mprove startup time for Neovim --
  use {
    "lewis6991/impatient.nvim",
  }
--[ colorscheme ]--
  use 'shaunsingh/nord.nvim'
--[ statusline ]--
  use {
      'nvim-lualine/lualine.nvim',
       requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
--[ bufferline ]--
  use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons'
  }

----[ Copilot ]--
--  use {
--      "github/copilot.vim"
--  }

--[ A completion plugin for Neovim ]--
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

--[ about lsp ]--
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'folke/lsp-colors.nvim'
  use 'nvim-lua/lsp-status.nvim' --This is a Neovim plugin/library for generating statusline components from the built-in LSP client

--[  A tree like view for symbols in Neovim using the Language Server Protocol. ]--
  use {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
    }

--[ File explorer ]--
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end,
    cmd = "NvimTreeToggle"
}

--[ An implementation of the Popup API from vim in Neovim ]--
  use {
    "nvim-lua/popup.nvim"
   }

--[ Indent Blankline ]--
  use {
    "lukas-reineke/indent-blankline.nvim"
   }

--[ Neovim Treesitter configurations and abstraction layer ]--
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }
  use {
      "p00f/nvim-ts-rainbow"
  }

--[ highly extendable fuzzy finder over lists]--
  use {
    'nvim-telescope/telescope.nvim',
     requires = { {'nvim-lua/plenary.nvim'} },
  }
  use {
     "nvim-telescope/telescope-media-files.nvim"
  }

--[ Useful lua functions used ny lots of plugins ]--
  use {
    "nvim-lua/plenary.nvim"
  }

--[ Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.It's easiest to explain with examples. Press cs"' inside ]--
   use {
      "tpope/vim-surround"
  }

-- --[ Multi-cursor ]--
  --  use {
  --     "mg979/vim-visual-multi"
  -- }

--[ History modification record ]--
   use {
      "mbbill/undotree"
   }

--[ Markdown preview ]--
    use { "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" },
   }

--[ A fast and lua alternative to filetype.vim. It is ~175x faster than filetype.vim ]--
    use { "nathom/filetype.nvim" }

--[ A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.]--
    use {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
      end
   }


------------------
-- Add Plug End --
------------------
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)


