-- init.lua – Neovim ≥0.9

-- BASIC SETTINGS
vim.opt.termguicolors = true          -- 24-bit RGB colors
vim.cmd.colorscheme('modcraeft')
vim.opt.cursorline = true

-- Tabs & indentation
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true             -- use spaces instead of tabs
vim.opt.smartindent = true

-- Scrolling & viewport
vim.opt.wrap        = false
vim.opt.sidescroll  = 1
vim.opt.scrolloff   = math.floor(vim.o.lines / 4)   -- keep ¼ of screen as buffer when scrolling
vim.opt.sidescrolloff = 8

-- Clipboard (use system clipboard)
vim.opt.clipboard = 'unnamedplus'

-- Line numbers
vim.wo.number         = true
vim.wo.relativenumber = true

-- Spelling (British English)
vim.opt.spell         = true
vim.opt.spelllang     = { 'en_gb' }

-- RESTORE LAST CURSOR POSITION
local lastplace_augroup = vim.api.nvim_create_augroup('LastPlace', { clear = true })
vim.api.nvim_create_autocmd('BufReadPost', {
  group = lastplace_augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- DISABLE NETRW (for nvim-tree)
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- PLUGINS
vim.cmd.source(vim.fn.stdpath('config') .. '/vim-plug/plugins.vim')

-- NVIM-TREE
require('nvim-tree').setup({
  sort = { sorter = 'case_sensitive' },
  view = { width = 30 },
  renderer = { group_empty = true },
  filters = { dotfiles = true },
})

-- NEOSCROLL (smooth scrolling)
local neoscroll = require('neoscroll')
neoscroll.setup({
  hide_cursor = true,
  stop_eof = true,
})

-- Remap PageUp/PageDown to smooth versions
local keymap = vim.keymap.set
keymap({'n', 'v'}, '<PageUp>',   function() neoscroll.scroll(-vim.wo.scroll, true, 150) end)
keymap({'n', 'v'}, '<PageDown>', function() neoscroll.scroll( vim.wo.scroll, true, 150) end)

--CENTER SCREEN AFTER ESC (zz on <Esc> in normal mode)
keymap('n', '<Esc>', '<Esc>zz', { silent = true })

--CENTER ON SEARCH NEXT/PREV
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')

