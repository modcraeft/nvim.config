vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.smartindent = true

vim.opt.wrap        = false
vim.opt.sidescroll  = 1
vim.opt.scrolloff   = math.floor(vim.o.lines / 4)
vim.opt.sidescrolloff = 8

vim.opt.clipboard   = "unnamedplus"
vim.opt.number      = true
vim.opt.relativenumber = true
vim.opt.spell       = true
vim.opt.spelllang   = { "en_gb" }


vim.opt.splitright = true

-- Restore cursor position
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_create_autocmd("BufReadPost", {
  group = lastplace,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Disable netrw (nvim-tree will take over)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
