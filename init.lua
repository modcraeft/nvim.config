--COLORS
vim.opt.termguicolors = true
vim.cmd 'colorscheme modcraeft'
vim.opt.cursorline = true 

--TABS
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

--SIDESCROLL
vim.cmd 'set nowrap'
vim.cmd 'set sidescroll=1'

--SCROLL OFFSET
vim.opt.scrolloff = math.floor(vim.opt.lines:get() / 4)

--XCLIP
vim.cmd 'set clipboard+=unnamedplus'

--Line Numbers
vim.wo.number = true
vim.o.relativenumber = true

--Restore Cursor Position
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = lastplace,
    pattern = { "*" },
    desc = "remember last cursor place",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

--Load Vim-Plug
vim.cmd("source $HOME/.config/nvim/vim-plug/plugins.vim")

--NEOSCROLL
require('neoscroll').setup()
vim.cmd 'map <PageUp> 	<C-b>'
vim.cmd 'map <PageDown> <C-f>'

--vim.cmd '<esc>:zz<cr>'
vim.cmd.normal(vim.api.nvim_replace_termcodes('<esc>zz<cr>', true, true, true))

--vim.cmd('cursor.vim')


-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


vim.opt.spell = true
vim.opt.spelllang = { "en_gb" } -- Set your preferred language(s)
