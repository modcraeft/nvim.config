-- ~/.config/nvim/init.lua
-- Ultra-minimal lazy.nvim bootstrap (2025 style)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load your actual config
require("lazy").setup("plugins")   -- looks in ~/.config/nvim/lua/plugins/ for *.lua files

-- Load your personal settings (colorscheme, options, keymaps, etc.)
require("config.options")
require("config.keymaps")
vim.cmd.colorscheme "modcraeft"
