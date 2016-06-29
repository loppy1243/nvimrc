augroup nasm
  au!
  au BufNewFile,BufReadPost *.asm setlocal filetype=nasm
  au Filetype nasm let b:comment_seq = ';'
augroup END

