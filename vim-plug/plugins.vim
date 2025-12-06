call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'YacineDo/mc.nvim'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'karb94/neoscroll.nvim'

Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-tree/nvim-web-devicons'

Plug 'sphamba/smear-cursor.nvim'

call plug#end()





lua require('smear_cursor').enabled = true
