" Plugins with Vim Plug
call plug#begin(stdpath('data') . '/plugged')

" --- TPOPE ---
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" --- JUNEGUNN ---
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
" --- LSP ---
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
" --- SNIPPETS ---
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
" --- TREESITTER ---
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" --- OTHER ---
Plug 'nvim-lua/plenary.nvim' " Required for some plugins. NOTE: Might not be need for any of the currently used plugins.
Plug 'kassio/neoterm'
Plug 'szw/vim-maximizer'
Plug 'vim-test/vim-test'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'sheerun/vim-polyglot'
Plug 'lambdalisue/fern.vim'

call plug#end()

" lua config with, e.g., LSP stuff
lua require('config')

" General stuff
set shell=/usr/local/bin/zsh
set mouse=a
set hlsearch
set hidden
set rnu
set nu
set incsearch
set noerrorbells
set tabstop=4 softtabstop=4
set foldmethod=manual
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set nowritebackup
set cmdheight=2 " Better display messages
set noshowcmd " Don't display, e.g., key strokes
set updatetime=300 " better experience for diagnostic messages
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes
set formatoptions-=cro " Stop newline continution of comments
set colorcolumn=80
set list
set listchars=tab:»\ ,trail:·,eol:¬
set nrformats+=alpha " To increment letters in addition to numbers
set completeopt=menuone,noinsert,noselect " For autocomplete. See :help completeopt
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

" Set statusline colour
function! MyHighlights() abort
    hi StatusLine ctermbg=237 ctermfg=254
    hi StatusLineNC ctermbg=252 ctermfg=238
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
" Set colour scheme
colorscheme srcery

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
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" write file
nnoremap <leader>w :w<cr>

" quit file
nnoremap <leader>q :q!

" remove hl
nnoremap <leader>h :nohl<cr>

" Use CTRL-L instead of <Esc> for relevant modes
inoremap <c-l> <esc>
xnoremap <c-l> <esc>
tnoremap <c-l> <C-\><C-n>

" Fix indentaion mapping
nnoremap <Tab> >>_
vnoremap <Tab> >
nnoremap <S-Tab> <<
vnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Register mapping
vnoremap <leader>p "_dP

" non-US keyboard makes it hard to type [ and ].
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]

" Navigate quickfix list with ease
nnoremap <silent> [p :cprevious<CR>
nnoremap <silent> [n :cnext<CR>

"Remove all trailing whitespace and removeing highlight
map <silent> <leader><cr> <cr>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><cr>

" Clear quickfix list
"
nmap <leader>cf :cexpr []<cr>
command! Qbuffers call setqflist(map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), '{"bufnr":v:val}')) "Populates quickfix list with buffers
nmap <leader>cb :Qbuffers<cr>


" Enable syntax highlighting when buffers are displayed in a window through
" :argdo and :bufdo, which disable the Syntax autocmd event to speed up
" processing.
augroup EnableSyntaxHighlighting
    " Filetype processing does happen, so we can detect a buffer initially
    " loaded during :argdo / :bufdo through a set filetype, but missing
    " b:current_syntax. Also don't do this when the user explicitly turned off
    " syntax highlighting via :syntax off.
    " The following autocmd is triggered twice:
    " 1. During the :...do iteration, where it is inactive, because
    " 'eventignore' includes "Syntax". This speeds up the iteration itself.
    " 2. After the iteration, when the user re-enters a buffer / window that was
    " loaded during the iteration. Here is becomes active and enables syntax
    " highlighting. Since that is done buffer after buffer, the delay doesn't
    " matter so much.
    " Note: When the :...do command itself edits the window (e.g. :argdo
    " tabedit), the BufWinEnter event won't fire and enable the syntax when the
    " window is re-visited. We need to hook into WinEnter, too. Note that for
    " :argdo split, each window only gets syntax highlighting as it is entered.
    " Alternatively, we could directly activate the normally effectless :syntax
    " enable through :set eventignore-=Syntax, but that would also cause the
    " slowdown during the iteration Vim wants to avoid.
    " Note: Must allow nesting of autocmds so that the :syntax enable triggers
    " the ColorScheme event. Otherwise, some highlighting groups may not be
    " restored properly.
    autocmd! BufWinEnter,WinEnter * nested if exists('syntax_on') && ! exists('b:current_syntax') && ! empty(&l:filetype) && index(split(&eventignore, ','), 'Syntax') == -1 | syntax enable | endif

    " The above does not handle reloading via :bufdo edit!, because the
    " b:current_syntax variable is not cleared by that. During the :bufdo,
    " 'eventignore' contains "Syntax", so this can be used to detect this
    " situation when the file is re-read into the buffer. Due to the
    " 'eventignore', an immediate :syntax enable is ignored, but by clearing
    " b:current_syntax, the above handler will do this when the reloaded buffer
    " is displayed in a window again.
    autocmd! BufRead * if exists('syntax_on') && exists('b:current_syntax') && ! empty(&l:filetype) && index(split(&eventignore, ','), 'Syntax') != -1 | unlet! b:current_syntax | endif
augroup END
