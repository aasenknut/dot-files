" Plugins with Vim Plug
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wsdjeg/FlyGrep.vim'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'lambdalisue/fern.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'kassio/neoterm'
Plug 'honza/vim-snippets'
Plug 'szw/vim-maximizer'
Plug 'vim-test/vim-test'

call plug#end()

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
set nobackup " This is recommended by coc
set undodir=~/.vim/undodir
set undofile
set nowritebackup " This is recommended by coc
set cmdheight=2 " Better display messages -- for coc
set noshowcmd " Don't display, e.g., key strokes
set updatetime=300 " better experience for diagnostic messages -- for coc
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes
set formatoptions-=cro " Stop newline continution of comments
set colorcolumn=80
set list
set listchars=tab:»\ ,trail:·,eol:¬
set nrformats+=alpha " To increment letters in addition to numbers
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
    hi StatusLine ctermbg=24 ctermfg=254
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

" Ctags go to definition
nnoremap gt <C-]>

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



"------------------------------------------------------------------------------
" Special search function (END)
"------------------------------------------------------------------------------
"


" Navigate quickfix list with ease
nnoremap <silent> [p :cprevious<CR>
nnoremap <silent> [n :cnext<CR>

"Remove all trailing whitespace and removeing highlight

map <silent> <leader><cr> <cr>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><cr>


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

" UNDOTREE
nnoremap <leader>u :UndotreeToggle<cr>


" Tagbar
nmap <leader>t :TagbarToggle<CR>

" NeoTerm
vnoremap <C-c><C-c> :TREPLSendSelection<CR>
nnoremap <C-c><C-c> :TREPLSendLine<CR>
let g:neoterm_autoscroll = '1' "Automatically scrolls when REPL is performed


"------------------------------------------------------------------------------
" Maximizer
"------------------------------------------------------------------------------

nnoremap <leader>m :MaximizerToggle!<CR>

"------------------------------------------------------------------------------
" coc.nvim config stuff (START)
"------------------------------------------------------------------------------
set pyxversion=3

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"

" coc-snippets:
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


"------------------------------------------------------------------------------
" coc.nvim config stuff (END)
