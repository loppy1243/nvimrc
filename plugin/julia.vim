func! s:JuliaSetup()
  setlocal tabstop=4
  let b:comment_seq = '#'
  let b:comment_esc = ''
endfunc

augroup julia
  au!
  au Filetype julia call JuliaSetup()
augroup END
