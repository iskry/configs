vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<C-t>', require('nvim-tree.api').tree.change_root_to_parent, { desc = 'Change root to parent', noremap = true, silent = true, nowait = true })
vim.keymap.set('n', '?', require('nvim-tree.api').tree.toggle_help, { desc = 'Toggle help', noremap = true, silent = true, nowait = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- Telescope keymaps
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10, previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search Git Files' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>st', function()
  require('telescope.builtin').live_grep {
    search_dirs = { vim.fn.expand('%:p:h') }
  }
end, { desc = 'Search Text in all files in current directory' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<CR>', { desc = 'Search by Grep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = 'Search Resume' })

-- Nvim-Tree keymaps
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>g', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Additional LSP keymaps moved from plugins.lua
-- (assuming lsp.lua is handling the primary LSP keymaps)

