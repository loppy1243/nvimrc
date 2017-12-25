func! s:RustSetup()
  let b:comment_seq = '//'
  let b:comment_esc = '/'
  setlocal tabstop=4
  compiler cargo
  nnoremap <buffer> <localleader>c :make build<cr>
  nnoremap <buffer> <localleader>C :make build --release<cr>
  nnoremap <buffer> <localleader>r :make run<cr>
  nnoremap <buffer> <localleader>R :make run --release<cr>
endfunc

augroup rust
  au!
  au Filetype rust call s:RustSetup()
augroup END
