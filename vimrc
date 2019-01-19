set nocompatible              " required
filetype off                  " required
set encoding=utf-8
let python_highlight_all=1
syntax on

" execute pathogen#infect()


autocmd! bufwritepost .vimrc source %

set timeoutlen=1000 ttimeoutlen=0
set clipboard=unnamed
set mouse=a
set bs=2
set rnu
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'whatyouhide/vim-gotham'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'python-mode/python-mode'
Plugin 'Zenburn'
Plugin 'junegunn/seoul256.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'edkolev/tmuxline.vim'
Plugin 'maralla/completor.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Bindings
"

:let mapleader = "\<Space>"

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Key map for VTR (Vim Tmux Runner)	
nnoremap <leader>vo :VtrOpenRunner<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>fr :VtrFocusRunner<cr> 
nnoremap <leader>q :VtrSendCommandToRunner<cr>
nnoremap <leader>s :VtrSendLinesToRunner<cr>
vnoremap <leader>s :VtrSendLinesToRunner<cr>

let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewLine = 1
"let g:VtrResizeRunner = 40
"let g:VtrReorientRunner = 

"Experimenter
let g:VtrClearSequence = "clear\r"

"
" Set
"

set rnu
set nu

set visualbell "Remove sound
"set numberwidth=4

" Disable Swap Files
set nobackup
set nowritebackup
set noswapfile

" Airlinoe
"let g:airline_solarized_bg='dark'

"
" Solarized color scheme
"

set background=dark
" colorscheme solarized
colo seoul256





