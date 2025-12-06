-- ~/.config/nvim/colors/modcraeft.lua
-- Author: modcraeft
-- Updated: 2025

vim.cmd.hi('clear')
if vim.g.colors_name then vim.cmd.colorscheme('default') end
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.g.colors_name = 'modcraeft'

local hi = function(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

-- Core highlight groups
hi('Normal',       { fg = '#e5e5e5', bg = '#000000' })
hi('Comment',      { fg = '#8888aa', italic = true })
hi('Constant',     { fg = '#5599ff' })
hi('String',       { fg = '#5599ff' })
hi('Identifier',   { fg = '#777777' })
hi('Function',     { fg = '#777777' })
hi('Statement',    { fg = '#5599ff', bold = true })
hi('PreProc',      { fg = '#777777' })
hi('Type',         { fg = '#999999' })
hi('Special',      { fg = '#5599ff' })
hi('Underlined',   { fg = '#80a0ff', underline = true })
hi('Error',        { fg = '#ffffff', bg = '#ff0000' })
hi('Todo',         { fg = '#050505', bg = '#ff0000', bold = true })
hi('CursorLine',   { bg = '#000000' })
hi('CursorLineNr', { fg = '#8888aa', bg = '#050505', bold = true })
hi('LineNr',       { fg = '#444444' })
hi('Visual',       { bg = '#264f78' })
hi('Search',       { fg = '#000000', bg = '#c0c000' })
hi('IncSearch',    { fg = '#ffffff', bg = '#ff8c00', bold = true })
hi('MatchParen',   { bg = '#008b8b' })
hi('Pmenu',        { fg = '#e5e5e5', bg = '#1c1c1c' })
hi('PmenuSel',     { fg = '#000000', bg = '#e5e5e5', bold = true })
hi('StatusLine',   { fg = '#5599ff', bg = '#050505' })
hi('StatusLineNC', { fg = '#5599ff', bg = '#000000' })
hi('VertSplit',    { fg = '#000000', bg = '#ffffff' })
hi('ColorColumn',  { bg = '#1f1f1f' })
hi('SignColumn',   { bg = 'none' })
hi('Folded',       { fg = '#7f7f7f', bg = '#1c1c1c' })
hi('NonText',      { fg = '#0000ff', bold = true })
hi('EndOfBuffer',  { fg = '#333333', bold = true })
hi('SpellBad',     { undercurl = false, underline = true, sp = '#ff0000' })
hi('SpellCap',     { undercurl = false, underline = true, sp = '#5c5cff' })

-- Diff
hi('DiffAdd',      { bg = '#003300' })
hi('DiffDelete',   { bg = '#330011' })
hi('DiffChange',   { bg = '#222244' })
hi('DiffText',     { bg = '#666688' })

-- Terminal colors
vim.g.terminal_color_0  = '#000000'
vim.g.terminal_color_1  = '#cd0000'
vim.g.terminal_color_2  = '#00cd00'
vim.g.terminal_color_3  = '#cdcd00'
vim.g.terminal_color_4  = '#0000ee'
vim.g.terminal_color_5  = '#cd00cd'
vim.g.terminal_color_6  = '#00cdcd'
vim.g.terminal_color_7  = '#e5e5e5'
vim.g.terminal_color_8  = '#7f7f7f'
vim.g.terminal_color_9  = '#ff0000'
vim.g.terminal_color_10 = '#00ff00'
vim.g.terminal_color_11 = '#ffff00'
vim.g.terminal_color_12 = '#5c5cff'
vim.g.terminal_color_13 = '#ff00ff'
vim.g.terminal_color_14 = '#00ffff'
vim.g.terminal_color_15 = '#ffffff'

-- Treesitter
hi('@variable',            { link = 'Identifier' })
hi('@function',            { link = 'Function' })
hi('@function.builtin',    { fg = '#5599ff', bold = true })
hi('@keyword',             { link = 'Statement' })
hi('@string',              { link = 'String' })
hi('@comment',             { link = 'Comment' })
hi('@punctuation',         { fg = '#777777' })
hi('@property',            { fg = '#e5e5e5' })
hi('@type',                { link = 'Type' })
hi('@constant',            { link = 'Constant' })
hi('@operator',            { fg = '#5599ff' })

-- LSP
hi('DiagnosticError',     { fg = '#ff0000' })
hi('DiagnosticWarn',      { fg = '#ffff00' })
hi('DiagnosticInfo',      { fg = '#00ffff' })
hi('DiagnosticHint',      { fg = '#5599ff' })
hi('LspDiagnosticsDefaultError',       { link = 'DiagnosticError' })
hi('LspDiagnosticsDefaultWarning',     { link = 'DiagnosticWarn' })
hi('LspDiagnosticsDefaultInformation', { link = 'DiagnosticInfo' })
hi('LspDiagnosticsDefaultHint',        { link = 'DiagnosticHint' })
