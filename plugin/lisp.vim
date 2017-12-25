func! s:LispSetup()
  let b:comment_seq = ';'
  let b:comment_esc = ''
  nnoremap <buffer> <c-[> :call vimrc#Lisp#PrevOpeningParen()<cr>
  nnoremap <buffer> <c-]> :call vimrc#Lisp#NextOpeningParen()<cr>
endfunc

func! s:RacketSetup()
  iabbrev <buffer> lambda λ
  iabbrev <buffer> #:exists #:∃
endfunc

augroup lisp
  au!
  au Filetype lisp,racket,scheme call LispSetup()
  au Filetype racket call RacketSetup()
augroup END
