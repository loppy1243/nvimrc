func! s:ManSetup()
  setlocal nonumber
  setlocal colorcolumn=0
endfunc

augroup myman
  au!
  au Filetype man call s:ManSetup()
augroup END
