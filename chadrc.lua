---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "blossom_light",
  theme_toggle = { "blossom_light", "tokyonight" },
  transparency = true,

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,
    header = {
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
      "",
      " [ TIP: To exit Neovim, just power off your computer ] ",
      "",
      "", "🫤 If I'm using Neovim, then my Emacs config must be broken!"
    },
  },
  buttons = {
    { "  Search File", "Spc Spc", "Telescope find_files" },
    { "  Search Project", "Spc /", "Telescope live_grep" },
    { "  Find Buffers", "Spc ,", "Telescope buffers" },
    { "  Find Old files", "Spc f o", "Telescope oldfiles" },
    { "  Bookmarks", "Spc f b", "Telescope marks" },
    { "  Themes", "Spc h t", "Telescope themes" },
    { "  Cheatsheet", "Spc h c", "NvCheatsheet" },
  },
  tabufline = { enabled = false }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

-- override default disabled plugins for performance

return M
