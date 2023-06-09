---@type MappingsTable
local M = {}

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>bn"] = { "<cmd> enew <CR>", "new buffer" },
    ["<leader>bd"] = { ":bd <CR>", "buffer delete" },
    ["<leader>fy"] = { ':let @+=expand("%")<CR>', "yank file path" },
    ["<leader>fY"] = { ':let @+=expand("%:p")<CR>', "yank file path" },
    ["<F5>"] = {
      function ()
        require("base46").toggle_theme()
        vim.g.neovide_background_color = "#0f1117" .. alpha()
      end,
      "toggle theme",
    },
  },

  v = {
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader><leader>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>/"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>,"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "find in current buffer" },
    ["<leader>fb"] = { "<cmd> Telescope vim_bookmarks all <CR>", "bookmarks" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },

    -- git
    ["<leader>fgc"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>fgs"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "find hidden term" },

    -- theme switcher
    ["<leader>ht"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },

    -- pickers
    ["<leader>f*"] = {
      function ()
        require("telescope.builtin").grep_string()
      end,
      "grep string",
    },
    ["<leader>fr"] = {
      function ()
        require("telescope.builtin").lsp_references()
      end,
      "lsp references",
    },
    ["<leader>fd"] = {
      function ()
        require("telescope.builtin").diagnostics()
      end,
      "diagnostics",
    },
    ["<leader>fp"] = {
      function ()
        require("telescope").extensions.project.project{}
      end,
      "find project",
    },
  },
}

M.tabs = {
  n = {
    ["<leader>1"] = { "1gt", "move to workspace 1" },
    ["<leader>2"] = { "2gt", "move to workspace 2" },
    ["<leader>3"] = { "3gt", "move to workspace 3" },
    ["<leader>4"] = { "4gt", "move to workspace 4" },
    ["<leader>5"] = { "5gt", "move to workspace 5" },
    ["<leader>6"] = { "6gt", "move to workspace 6" },
    ["<leader>7"] = { "7gt", "move to workspace 7" },
    ["<leader>8"] = { "8gt", "move to workspace 8" },
    ["<leader>9"] = { "9gt", "move to workspace 9" },
  },
}

M.fugitive = {
  n = {
    ["<leader>gg"] = { ":G <CR>", "git status" },
    ["<leader>go"] = { ":GBrowse <CR>", "git open url" },
    ["<leader>gf"] = { ":Git fetch <CR>", "git fetch" },
    ["<leader>gF"] = { ":Git pull <CR>", "git pull" },
    ["<leader>gP"] = { ":Git push <CR>", "git push" },
    ["<leader>gll"] = { ":Gllog -100 <CR>", "git log" },
    ["<leader>glc"] = { ":0Gclog -100 <CR>", "git log current file" },
  },

  v = {
    ["<leader>go"] = { ":GBrowse <CR>", "open github file" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gx"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>gd"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>gb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["<leader>gt"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<A-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<A-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<leader><DEL>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<leader><DEL>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>cd"] ={ "<cmd>TroubleToggle quickfix<cr>", "trouble toggle" },
  },
}

M.bookmarks = {
  n = {
    ["mm"] = { "<cmd>BookmarkToggle<cr>", "bookmark toggle" },
    ["mi"] = { "<cmd>BookmarkAnnotate<cr>", "bookmark annotate" },
    ["mn"] = { "<cmd>BookmarkNext<cr>", "bookmark next" },
    ["mp"] = { "<cmd>BookmarkPrev<cr>", "bookmark prev" },
    ["ma"] = { "<cmd>BookmarkShowAll<cr>", "bookmark show all" },
    ["mc"] = { "<cmd>BookmarkClear<cr>", "bookmark clear" },
    ["mx"] = { "<cmd>BookmarkClearAll<cr>", "bookmark clear all" },
  },
}

M.harpoon = {
  -- plugin = true,
  n = {
    ["<leader>a"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "mark add file",
    },
    ["<C-e>"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "ui toggle_quick_menu",
    },
    ["<C-h>"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "ui nav_file 1",
    },
    ["<C-j>"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "ui nav_file 2",
    },
    ["<C-k>"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "ui nav_file 3",
    },
    ["<C-l>"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "ui nav_file 4",
    },
  },
}

-- more keybinds!

return M
