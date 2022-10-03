set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Format on write!
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()

" LSP bindings
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <C-s> :lua vim.lsp.buf.signature_help()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
"nnoremap <leader>d :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>e :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>cd :lua vim.diagnostic.setqflist()<CR>
