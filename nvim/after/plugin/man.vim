fun! ReadMan()
  " Assign current word under cursor to a script variable:
  let s:man_word = expand('<cword>')
  " Read in the manpage for man_word (col -b is for formatting):
  :exe ":Man " . s:man_word . ""
  " Goto first line...
  :exe ":goto"
endfun
nmap <c-m> :call ReadMan()<CR>
