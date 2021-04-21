" VIM-TEST

if has('nvim')
  let test#strategy='neovim'
else
  let test#strategy='vimterminal'
endif

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-a> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-v> :TestVisit<CR>
