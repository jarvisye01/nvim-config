-- jarvisye's nvim config

-- nvim options and keymaps
require('options')
require('keymaps')

-- load plugins(vim-plug)
vim.cmd [[
    call plug#begin("~/.config/nvim/plugins")
    Plug 'ojroques/nvim-hardline',
    Plug 'preservim/nerdtree',
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'fatih/vim-go',
    Plug 'Mofiqul/dracula.nvim',
    Plug 'nvim-treesitter/nvim-treesitter',
    Plug 'nvim-lua/plenary.nvim',
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' },
    call plug#end()
]]

-- nvim plugins setup
require('config.plugins-setup')

-- remember line last open
vim.cmd [[
    if has("autocmd")
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    endif
]]
