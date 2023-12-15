-- nerdtree plugin
vim.keymap.set('n', '<F9>', ':NERDTree<CR>')
vim.keymap.set('n', '<F10>', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', ':NERDTreeFind<CR>')

-- vim-go
vim.g.go_test_show_name = 1
vim.g.go_test_timeout = '30s'
vim.g.go_fmt_autosave = 1
vim.g.go_gopls_gofumpt = 'v:gofumpt'
vim.g.go_doc_keywordprg_enabled = 0

-- vim-hardline
require('hardline').setup {
    bufferline = true,  -- disable bufferline
    bufferline_settings = {
        exclude_terminal = false,  -- don't show terminal buffers in bufferline
        show_index = true,        -- show buffer indexes (not the actual buffer numbers) in bufferline
    },
    sections = {         -- define sections
        {class = 'mode', item = require('hardline.parts.mode').get_item},
        {class = 'high', item = require('hardline.parts.git').get_item, hide = 100},
        {class = 'med', item = require('hardline.parts.filename').get_item},
        '%<',
        {class = 'med', item = '%='},
        {class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 100},
        {class = 'error', item = require('hardline.parts.lsp').get_error},
        {class = 'warning', item = require('hardline.parts.lsp').get_warning},
        {class = 'warning', item = require('hardline.parts.whitespace').get_item},
        {class = 'high', item = require('hardline.parts.filetype').get_item, hide = 60},
        {class = 'mode', item = require('hardline.parts.line').get_item},
    }
}

-- dracula
vim.cmd.colorscheme "dracula-soft"

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "markdown" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}

-- coc-nvim
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- GoTo code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

-- coc-lists
vim.keymap.set('n', '<leader>f', ':CocList -N --top files<CR>')
vim.keymap.set('n', '<leader>c', ':CocList -N --top<CR>')
