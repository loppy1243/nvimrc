augroup lisp
  au!
  " Lisp comment sequence
  au Filetype lisp,racket,scheme let b:comment_seq = ';'
  au Filetype racket iabbrev <buffer> lambda λ
  au Filetype racket iabbrev <buffer> #:exists #:∃
augroup END

