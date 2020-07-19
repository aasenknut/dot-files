
" General stuff
set shell=/usr/local/bin/zsh
set mouse=a
set hlsearch
set rnu
set nu
set incsearch
set shortmess+=c
set hidden
set cmdheight=2
set updatetime=300
set signcolumn
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nowrap
set noswapfile
set nobackup " This is recommended by coc
set nowritebackup " This is recommended by coc
set formatoptions-=cro " Stop newline continution of comments
set colorcolumn=80
set list
set listchars=tab:»\ ,trail:·,eol:¬
set nrformats+=alpha " To increment letters in addition to numbers
language en_US
syntax on
"------------------------------------------------------------------------------
" Key-bindings follow.
"------------------------------------------------------------------------------

" set leader 
let mapleader = "\<Space>" 

" bind Ctrl+<movement> keys to move around the windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Move lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" move between tabs by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr> 

" Terminal
nnoremap <leader>t :terminal<cr>

" write file
nnoremap <leader>w :w<cr>

" Use CTRL-c instead of <Esc>
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

"noremap <leader>s  :%s//gc<left><left><left>
" Replace all in document with confirmation

" Clear search highlighting
map <silent> <leader><cr> :noh<cr>

" Toggle ignorecase
map <leader>c :set ic!<cr>


"------------------------------------------------------------------------------
" STATUS LINE
"------------------------------------------------------------------------------

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 


"------------------------------------------------------------------------------
" Special search functionality (START)
"------------------------------------------------------------------------------

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
" With visual selected:
nnoremap <leader>pr :argdo %s///gc \| update<left><left><left><left><left><left><left><left><left><left><left><left><left>
xmap <leader>pr <Esc>:argdo %s/<c-r>=GetVisual()<cr>//gc \| update<left><left><left><left><left><left><left><left><left><left><left><left>

"------------------------------------------------------------------------------
" Special search function (END)
"------------------------------------------------------------------------------
