func! s:StatusSetup()
  setlocal buftype=nofile
  " Probably want to change this
  setlocal bufhidden=delete
  setlocal noswapfile
  setlocal nonumber
endfunc

func! s:CommitSetup()
  setlocal bufhidden=delete
endfunc

augroup git
  au!
  au Filetype gitstatus call s:StatusSetup()
augroup END

"" Git mappings
nnoremap <leader><leader><leader> :call vimrc#Git#Commit()<cr>
nnoremap <leader><leader>s :call vimrc#Git#Status()<cr>
