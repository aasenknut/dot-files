"""General settings for the plugin VimGO
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

nmap <leader>gr :GoRun<CR>
nmap <leader>gt :GoTest<CR>
nmap <leader>gb :GoBuild<CR>
nmap <leader>gi :GoImports<CR>

