func! s:MakeMemo()
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setfiletype memo
endfunc

augroup memo
  au!
  au BufReadCmd memo://* call s:MakeMemo()
augroup END
