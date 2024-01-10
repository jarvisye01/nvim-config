-- nerdtree plugin
vim.keymap.set('n', '<F9>', ':NERDTree<CR>')
vim.keymap.set('n', '<F10>', ':NERDTreeToggle<CR>')

-- vim-go
vim.g.go_test_show_name = 1
vim.g.go_test_timeout = '30s'
vim.g.go_fmt_autosave = 1
vim.g.go_gopls_gofumpt = 'v:gofumpt'
vim.g.go_doc_keywordprg_enabled = 0

-- vim-hardline
require('hardline').setup {
    bufferline = true,  -- disable bufferline
}

-- catppuccin
-- require("catppuccin").setup {
--     flavour = "macchiato",
-- }
-- vim.cmd.colorscheme "catppuccin"

-- dracula
-- vim.cmd.colorscheme "dracula"

-- onedark
require("onedark").setup {
    style = "warm",
}
vim.cmd.colorscheme "onedark"

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "markdown" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 1024 * 1024 -- 1MB
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

-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { silent = true })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { silent = true })

-- Gitsigns
require('gitsigns').setup {
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
}

vim.keymap.set('n', '<leader>gn', ':Gitsigns next_hunk<CR>', { silent = true })
vim.keymap.set('n', '<leader>gp', ':Gitsigns prev_hunk<CR>', { silent = true })

-- ToggleTerm
require('toggleterm').setup {
    open_mapping = [[<C-\>]],
    close_on_exit = true,
    insert_mappings = true,
    terminal_mappings = true,
    direction = 'float',
}

-- Indent Blankline
-- require('ibl').setup {}

-- Diff View
require('diffview').setup {
    view = {
        merge_tool = {
            layout = 'diff3_mixed',
        },
    },
}

-- Nvim Surround
require('nvim-surround').setup {}

-- Aerial
require("aerial").setup {}

-- Nvim Autopairs
require("nvim-autopairs").setup {}
