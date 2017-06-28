augroup lisp
  au!
  au BufNewFile,BufReadPost *.asd setlocal filetype=lisp
  " Lisp comment sequence
  au Filetype lisp,racket,scheme let b:comment_seq = ';'
  au Filetype lisp,racket,scheme let b:comment_esc = ''
  au Filetype racket iabbrev <buffer> lambda λ
  au Filetype racket iabbrev <buffer> #:exists #:∃
  au Filetype lisp,racket,scheme nnoremap <buffer> <c-[> :call PrevOpeningParen()<cr>
  au Filetype lisp,racket,scheme nnoremap <buffer> <c-]> :call NextOpeningParen()<cr>
augroup END
