local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = overrides.mason
  },

{
   "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",

       -- low level
        "c",
        "zig"
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = overrides.nvimtree,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },

  {
    "nvim-telescope/telescope-project.nvim",
    -- lazy = false,
  },

  ["nvim-telescope/telescope.nvim"] = {
    lazy = false,
    extensions_list = { "themes", "terms", "project" },
  },

  -- Install a plugin

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    -- lazy = false,
    config = function()
      require("trouble").setup {
        icons = true,
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  {
    "github/copilot.vim",
    lazy = false,
  },


  {
    "theprimeagen/harpoon",
    -- lazy = false,
  },

  {
    "laytan/cloak.nvim",
    -- lazy = false,
  },
  -- { "catppuccin/nvim", name = "catppuccin" },
  -- laytan/cloak.nvim

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = { "G", "Git", "Gllog", "Gclog" },
    extensions_list = { "themes", "terms", "project" },
  },

  {
    "tpope/vim-rhubarb",
    lazy = true,
    cmd = { "GBrowse" },
  },
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   -- conflicts with fugitive
  --   enabled = false
  -- },

  { "junegunn/fzf", lazy = false, },
  { "junegunn/fzf.vim", lazy = false, },
  { "Konfekt/vim-alias", lazy = false, },
  { "dbakker/vim-projectroot", lazy = false, },
  { "s1341/vim-tabws", lazy = false, },
-- lug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


}

return plugins
