"""General settings for the plugin Fern
let g:fern#disable_default_mappings = 1
let g:fern#disable_drawer_auto_quit = 1
let g:fern#default_hidden=1

"""For fern-renderer-nerdfont.vim
let g:fern#renderer = "nerdfont"

noremap <silent> <Leader>n :Fern . -drawer -width=50 -toggle<CR><C-w>=

"" let g:fern#mark_symbol                       = '●'
"" let g:fern#renderer#default#collapsed_symbol = '» '
"" let g:fern#renderer#default#expanded_symbol  = '× '
"" let g:fern#renderer#default#leading          = ' '
"" let g:fern#renderer#default#leaf_symbol      = ' '
"" let g:fern#renderer#default#root_symbol      = '~ '

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer><nowait> K <Plug>(fern-action-leave)
  nmap <buffer><nowait> J <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" --- GLYPH PALLETTE FOR COLOURS ON GLYPS ---

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" --- FERN-PREVIEW PLUGIN ---
function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END
