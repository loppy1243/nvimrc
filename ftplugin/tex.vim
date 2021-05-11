"if exists('s:executed')
"  finish
"endif
"let s:executed = 1

setlocal makeprg=pdflatex

" Latex comment sequence
let b:comment_seq = '%'
let b:comment_esc = ''

nnoremap <buffer> <localleader>ll @<plug>(vimtex-compile)
