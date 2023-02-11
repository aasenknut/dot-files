vim.g.go_def_mapping_enabled = 0
vim.g.go_doc_keywordprg_enabled = 0
-- Mappings
vim.keymap.set('n', '<C-p>', ':Files<CR>')
vim.keymap.set('n', '<leader>b', ':Buffer<CR>')
vim.keymap.set('n', '<leader>rg', ':Rg<CR>')
-- FZF lsp
vim.keymap.set('n', '<leader>sr', ':References<CR>')
