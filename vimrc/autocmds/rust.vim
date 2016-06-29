augroup rust
  au!
  au Filetype rust let b:comment_seq = '//'
  au Filetype rust setlocal tabstop=4
  au Filetype rust compiler cargo
  au Filetype rust nnoremap <buffer> <localleader>c :make build<cr>
  au Filetype rust nnoremap <buffer> <localleader>C :make build --release<cr>
  au Filetype rust nnoremap <buffer> <localleader>r :make run<cr>
  au Filetype rust nnoremap <buffer> <localleader>R :make run --release<cr>
augroup END

