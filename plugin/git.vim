func! s:StatusSetup()
  setlocal buftype=nofile
  " Probably want to change this
  setlocal bufhidden=delete
  setlocal noswapfile
  setlocal nonumber
endfunc

augroup git
  au!
  au Filetype git-status call s:StatusSetup()
augroup END
