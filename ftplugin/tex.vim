" Latex comment sequence
let b:comment_seq = '%'
let b:comment_esc = ''

augroup MyTex
    autocmd!
    autocmd User VimtexEventCompileSuccess silent! !killall -SIGHUP llpp
augroup END
