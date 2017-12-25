func! s:VimscriptSetup()
  let b:comment_seq = '"'
  let b:comment_esc = ''
endfunc

augroup vimscript
  au!
  au Filetype vim call VimscriptSetup()
augroup END
