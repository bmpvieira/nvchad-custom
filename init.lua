-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- MACOS
vim.g.neovide_input_macos_alt_is_meta = true

-- VIM
vim.opt.relativenumber = true

-- FOLDING
-- https://www.jmaguire.tech/posts/treesitter_folding/
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/4152 
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99

-- THEME
-- vim.cmd.colorscheme "catppuccin-latte"
-- vim.g.tokyonight_dark_float = false
vim.opt.guifont = "Iosevka:h14"

-- TRANSPARENCY
vim.opt.pumblend=10
vim.opt.winblend=10
-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0
vim.g.transparency = 0.95
vim.g.neovide_background_color = "#fefefe" .. alpha()
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_hide_mouse_when_typing = true

-- DEPENDENCIES
vim.opt.rtp:prepend("/opt/homebrew/opt/fzf") --tabws

-- PERFORMANCE
vim.g.neovide_refresh_rate = 100
