"------------------------------------------------------------------------------
" General stuff -- mostly 'set' stuff.
"------------------------------------------------------------------------------
set mouse=a " Enable mouse
set hlsearch
set hidden
set rnu " Relative line numbers
set nu " Line numbers
set incsearch
set noerrorbells
set tabstop=4 softtabstop=4
set foldmethod=manual
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set ignorecase
set autoindent
set nowrap
set noswapfile
set nobackup
set guicursor=n-v-c:block-Cursor
set undodir=~/.vim/undodir
set undofile
set nowritebackup
set cmdheight=2 " Better display messages
set noshowcmd " Don't display, e.g., key strokes
set updatetime=300 " better experience for diagnostic messages
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes
set formatoptions-=cro " Stop newline continution of comments
set clipboard^=unnamed,unnamedplus " Cross platform solution for clipboard.
set colorcolumn=80
set list
set listchars=tab:»\ ,trail:·,eol:¬
set nrformats+=alpha " To increment letters in addition to numbers
set completeopt=menu,menuone,noinsert,noselect " For autocomplete. See :help completeopt
language en_US
syntax on
"  Colours
let base16colorspace=256

"------------------------------------------------------------------------------
" Statusline and colours
"------------------------------------------------------------------------------
" Set statusline content
set laststatus=2
set statusline=[%n]
set statusline+=\ %<%.99f
set statusline+=\ %y%h%w%m%r
set statusline+=\ %{FugitiveStatusline()}
set statusline+=%= "Split statusline left/right
set statusline+=%-11.([%l/%L,%c]%)\ %p%%

set noshowmode " This is to remove the mode from below the statusbar, e.g., -- INSERT --, and -- VISUAL --

"------------------------------------------------------------------------------
" COLOURS
"------------------------------------------------------------------------------
set background=dark

"------------------------------------------------------------------------------
" Key-bindings follow.
"------------------------------------------------------------------------------
" set leader
let mapleader = "\<Space>"

"------------------------------------------------------------------------------
" Auto update files on change
"------------------------------------------------------------------------------
set autoread
au CursorHold * checktime

" -------
" WINDOWS
" -------
" bind Ctrl+<movement> keys to move around the windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
" Window resize
" Height:
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" ----
" TABS
" ----
" move around between tabs:
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 5gt
nnoremap <leader>7 5gt
nnoremap <leader>8 5gt
nnoremap <leader>9 5gt
" open and close:
nnoremap <leader>to :tabnew%<CR>
nnoremap <leader>tc :tabclose<CR>

" Move lines up and down
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" write file
nnoremap <leader>w :w!<cr>

" quit file
nnoremap <c-q> :q!<cr>


" Use CTRL-L instead of <Esc> for relevant modes
inoremap <c-l> <esc>
xnoremap <c-l> <esc>
tnoremap <c-l> <C-\><C-n>

" Jumplist fix. Since <Tab> is going to be used for indentation, we need to remap <C-i>
nnoremap <C-n> <C-i>

" Fix indentaion mapping
nnoremap <Tab> >>_
vnoremap <Tab> >
nnoremap <S-Tab> <<
vnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Register mapping
vnoremap <leader>pp "_dP

" Navigate quickfix list with ease
nnoremap <silent> [p :cprevious<CR>
nnoremap <silent> [n :cnext<CR>
nnoremap <silent> <c-[> :cprevious<CR>zz
nnoremap <silent> <c-]> :cnext<CR>zz
nnoremap <silent> <c-,> :lprevious<CR>zz
nnoremap <silent> <c-.> :lnext<CR>zz

" Keep cursor in middle when jumping and searching
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap n nzzzv
nmap N Nzzzv

" Move a bit more than just one line at a time
vim.keymap.set("n", "<C-e>", "3<C-e>")
vim.keymap.set("n", "<C-y>", "3<C-y>")

" -------------
" QUICKFIX LIST
" -------------
" Clear quickfix list:
nmap <leader>cl :cexpr []<cr>

" Populate quickfix list with buffers:
command! Qbuffers call setqflist(map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), '{"bufnr":v:val}'))
nmap <leader>cb :Qbuffers<cr>

" ---------
" MAN PAGES
" ---------
fun! ReadMan()
  " Assign current word under cursor to a script variable:
  let s:man_word = expand('<cword>')
  " Read in the manpage for man_word (col -b is for formatting):
  :exe ":Man " . s:man_word . ""
  " Goto first line...
  :exe ":goto"
endfun
nmap <c-m> :call ReadMan()<CR>



" --------------
" SPECIAL SEARCH
" --------------

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

" Search and replace across project:
" Give strings:
nnoremap <leader>pr :cfdo %s///gc \| update<left><left><left><left><left><left><left><left><left><left><left><left><left>
" With visual selected:
xmap <leader>pr <Esc>:cfdo %s/<c-r>=GetVisual()<cr>//gc \| update<left><left><left><left><left><left><left><left><left><left><left><left>

" Search and replace in file:
nnoremap <leader>fr :%s///gc<left><left><left><left>
" With visual selected:
xmap <leader>fr <Esc>:%s/<c-r>=GetVisual()<cr>//gc<left><left><left>
" Search inside file:
xmap <leader>fs <Esc>/<c-r>=GetVisual()<cr>
" Ripgrep search
xmap <leader>rg <Esc>:Rg <c-r>=GetVisual()<cr>
" Populate quickfix list with vim grep
xmap <leader>cg <Esc>:grep! <c-r>=GetVisual()<cr>

