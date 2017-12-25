func! s:NasmSetup()
  let b:comment_seq = ';'
  let b:comment_esc = ''
endfunc

augroup nasm
  au!
  au Filetype nasm call s:NasmSetup()
augroup END
