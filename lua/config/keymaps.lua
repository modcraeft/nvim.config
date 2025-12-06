-- ~/.config/nvim/lua/config/keymaps.lua
-- All your personal keymaps – clean, modern, zero warnings

local map = vim.keymap.set
local opts = { silent = true }

-- ──────────────────────────────
-- Leader & local leader
-- ──────────────────────────────
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- ──────────────────────────────
-- Neoscroll – smooth scrolling (new API, no warnings)
-- ──────────────────────────────
local neoscroll = require("neoscroll")

neoscroll.setup({
  hide_cursor       = true,   -- you like this
  stop_eof          = true,
  respect_scrolloff = true,
  cursor_scrolls_alone = true,
})

-- PageUp / PageDown → smooth half-page scrolls
map({"n", "v"}, "<PageUp>",   function()
  neoscroll.scroll(-vim.wo.scroll, { move_cursor = true, duration = 150 })
end, opts)

map({"n", "v"}, "<PageDown>", function()
  neoscroll.scroll( vim.wo.scroll, { move_cursor = true, duration = 150 })
end, opts)

-- Optional extras (uncomment if you want them)
-- map("n", "<C-u>", function() neoscroll.ctrl_u({ duration = 120 }) end, opts)
-- map("n", "<C-d>", function() neoscroll.ctrl_d({ duration = 120 }) end, opts)
-- map("n", "zz", neoscroll.zz, opts)
-- map("n", "zt", neoscroll.zt, opts)
-- map("n", "zb", neoscroll.zb, opts)

-- ──────────────────────────────
-- Centering goodies
-- ──────────────────────────────
map("n", "<Esc>", "<Esc>zz", opts)        -- escape → center screen
map("n", "n",     "nzzzv",  opts)        -- next search → center
map("n", "N",     "Nzzzv",  opts)        -- prev search → center
map("n", "g;",    "g;zz",   opts)        -- jump older → center
map("n", "g,",    "g,zz",   opts)        -- jump newer → center

-- ──────────────────────────────
-- Quick sanity shortcuts
-- ──────────────────────────────
map("n", "<leader>w", ":w<CR>",      { desc = "Save buffer" })
map("n", "<leader>q", ":q<CR>",      { desc = "Quit" })
map("n", "<leader>Q", ":qa!<CR>",    { desc = "Quit without saving" })

-- Clear search highlight with Esc in normal mode (double-Esc is common)
map("n", "<Esc><Esc>", ":noh<CR>", opts)

-- ──────────────────────────────
-- You can keep adding whatever you want below this line
-- ──────────────────────────────

return {}
