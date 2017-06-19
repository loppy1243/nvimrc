augroup lisp
  au!
  au BufNewFile,BufReadPost *.asd setlocal filetype=lisp
  " Lisp comment sequence
  au Filetype lisp,racket,scheme let b:comment_seq = ';'
  au Filetype lisp,racket,scheme let b:comment_esc = ''
  au Filetype racket iabbrev <buffer> lambda λ
  au Filetype racket iabbrev <buffer> #:exists #:∃
augroup END

