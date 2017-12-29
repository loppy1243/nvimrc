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
  au Filetype gitcommit call s:CommitSetup()
augroup END

nnoremap <leader><leader><leader> :call vimrc#Git#Commit()<cr>
nnoremap <leader><leader>s :call vimrc#Git#Status()<cr>
nnoremap <leader><leader>g :!git<space>
nnoremap <leader><leader>a :!git add %<cr><cr>
nnoremap <leader><leader>A :!git add -u<cr><cr>
