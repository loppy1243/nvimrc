" vimrc
nnoremap <leader>ev :tab split $MYVIMRC<cr>:exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>
nnoremap <leader>Ev :e $MYVIMRC<cr>:exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>
nnoremap <leader>EV :e $MYVIMRC<cr>:exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>
