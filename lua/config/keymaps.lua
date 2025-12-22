-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set
local opts = { silent = true }


-- Leader & local leader
vim.g.mapleader      = " "
vim.g.maplocalleader = " "


-- Neoscroll – smooth scrolling
local neoscroll = require("neoscroll")

neoscroll.setup({
  hide_cursor       = true,
  stop_eof          = true,
  respect_scrolloff = true,
  cursor_scrolls_alone = true,
})

-- PageUp / PageDown
map({"n", "v"}, "<PageUp>",   function()
  neoscroll.scroll(-vim.wo.scroll, { move_cursor = true, duration = 150 })
end, opts)

map({"n", "v"}, "<PageDown>", function()
  neoscroll.scroll( vim.wo.scroll, { move_cursor = true, duration = 150 })
end, opts)

-- Optional extras
-- map("n", "<C-u>", function() neoscroll.ctrl_u({ duration = 120 }) end, opts)
-- map("n", "<C-d>", function() neoscroll.ctrl_d({ duration = 120 }) end, opts)
-- map("n", "zz", neoscroll.zz, opts)
-- map("n", "zt", neoscroll.zt, opts)
-- map("n", "zb", neoscroll.zb, opts)


-- Centering
-- map("n", "<Esc>", "<Esc>zz", opts)        -- escape → center screen
map("n", "n",     "nzzzv",  opts)        -- next search → center
map("n", "N",     "Nzzzv",  opts)        -- prev search → center
map("n", "g;",    "g;zz",   opts)        -- jump older → center
map("n", "g,",    "g,zz",   opts)        -- jump newer → center


-- Quick sanity shortcuts
map("n", "<leader>w", ":w<CR>",      { desc = "Save buffer" })
map("n", "<leader>q", ":q<CR>",      { desc = "Quit" })
map("n", "<leader>Q", ":qa!<CR>",    { desc = "Quit without saving" })

-- Clear search highlight with Esc in normal mode (double-Esc is common)
map("n", "<Esc><Esc>", ":noh<CR>", opts)

-- Parrot (<leader>pc)
map("n", "<leader>pc", ":PrtChatNew<CR>", { desc = "Parrot: New Chat" })
map("v", "<leader>pr", ":PrtRewrite ", { desc = "Parrot: Rewrite selection" })

-- Terminal (<leader>t)
local map = vim.keymap.set

map("n", "<leader>t", function()
  vim.cmd("botright split")
  vim.cmd("resize 15")        -- optional: set height
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Open terminal in bottom horizontal split (full width)" })

return {}
