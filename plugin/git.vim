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

"" Git mappings
nnoremap <leader><leader><leader> :!git commit<cr>
nnoremap <leader><leader>s :call vimrc#Git#Status()<cr>
