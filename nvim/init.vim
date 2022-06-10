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
" --- FORMATTER ---
Plug 'mhartington/formatter.nvim'
" --- JAVA ---
Plug 'mfussenegger/nvim-jdtls'
" --- RUST ---
Plug 'simrat39/rust-tools.nvim'
" --- SNIPPETS ---
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
" --- TREESITTER ---
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" --- FERN (file viewer) ---
Plug 'lambdalisue/fern.vim'
Plug 'yuki-yano/fern-preview.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-git-status.vim'
" --- COLOURS ---
Plug 'srcery-colors/srcery-vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" --- DEBUGGER (DAP) ---
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap-python'
Plug 'leoluz/nvim-dap-go'
" --- TESTING ---
Plug 'vim-test/vim-test'
" --- OTHER ---
Plug 'nvim-lua/plenary.nvim' " Required for some plugins. NOTE: Might not be need for any of the currently used plugins.
Plug 'kassio/neoterm' " Easy to use for REPL
Plug 'szw/vim-maximizer'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'sheerun/vim-polyglot'
Plug 'kyazdani42/nvim-web-devicons' " Icons



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
set smartcase
set ignorecase
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
"set background=dark
let g:catppuccin_flavour = "macchiato"
colorscheme catppuccin

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
nnoremap <leader>to :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>

" Move lines up and down
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" write file
nnoremap <leader>w :w<cr>

" quit file
nnoremap <leader>q :q!

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

" -------------
" QUICKFIX LIST
" -------------
" Clear quickfix list:
nmap <leader>cf :cexpr []<cr>
" Populate quickfix list with buffers:
command! Qbuffers call setqflist(map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), '{"bufnr":v:val}'))
nmap <leader>cb :Qbuffers<cr>
