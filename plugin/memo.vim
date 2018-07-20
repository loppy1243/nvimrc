func! s:MakeMemo()
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfunc

function <SID>OpenMemo(name, ftype)
  call vimrc#SplitWindowInDirection()
  call vimrc#OpenMemo(a:name, a:ftype)
endfunc

augroup memo
  au!
  au BufReadCmd memo://* call s:MakeMemo()
augroup END

nnoremap <leader>m :call vimrc#OpenMemo()<cr>
nnoremap <localleader>ms :call <SID>OpenMemo('scratch', &l:filetype)<cr>
nnoremap <localleader>mm :call vimrc#OpenMemo('scratch', &l:filetype)<cr>
