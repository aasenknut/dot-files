nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" -----------------
" LANGUAGE SPECIFIC
" -----------------

" PYTHON
let test#python#runner = 'pytest'
"Runners available are 'pytest', 'nose', 'nose2', 'djangotest', 'djangonose', 'mamba', and Python's built-in unittest as 'pyunit'

" GO
let test#go#runner = 'delve'
" Runners available are 'gotest', 'ginkgo', 'richgo', 'delve'
