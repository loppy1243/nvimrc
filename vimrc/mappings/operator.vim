""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Mappings that define operators.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call Include(g:vimrc_dir . '/functions/operators.vim')

"" Double-quoting operator
nnoremap <leader>" :set operatorfunc=DoubleQuoteOperator<cr>g@
vnoremap <leader>" :call DoubleQuoteOperator(visualmode())<cr>

"" Single-quoting operator
nnoremap <leader>' :set operatorfunc=SingleQuoteOperator<cr>g@
vnoremap <leader>' :call SingleQuoteOperator(visualmode())<cr>

