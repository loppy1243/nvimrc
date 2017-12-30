"func! s:EvalBlock
"endfunc

func! s:JuliaSetup()
  setlocal tabstop=4
  let b:comment_seq = '#'
  let b:comment_esc = ''
  let b:term_cmd = 'julia'
endfunc

augroup julia
  au!
  au Filetype julia call s:JuliaSetup()
augroup END
