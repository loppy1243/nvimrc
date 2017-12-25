func! s:ShellSetup()
  let b:comment_seq = '#'
  let b:comment_esc = ''
endfunc

augroup shell
  au!
  au Filetype zsh,bash,sh,crontab call ShellSetup()
augroup END
