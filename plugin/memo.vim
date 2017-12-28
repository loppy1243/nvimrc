func! s:MakeMemo(uri)
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal filetype=memo
endfunc

augroup memo
  au!
  au BufReadCmd memo://* call s:MakeMemo(expand('<afile>'))
augroup END
