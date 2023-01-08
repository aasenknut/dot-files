-- let g:go_def_mapping_enabled = 0
-- let g:go_doc_keywordprg_enabled = 0

vim.keymap.set('n', 'goi', ':GoImports<CR>')
vim.keymap.set('n', 'got', ':GoAddTags<CR>')
vim.keymap.set('n', 'gom', ':GoImplements<CR>')
vim.keymap.set('n', 'gos', ':GoFillStruct<CR>')
