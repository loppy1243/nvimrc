""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Mappings that define operators.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call Include(g:vimrc_dir . '/functions/operators.vim')

"" Double-quoting operator
nnoremap <leader>" :set operatorfunc=vimrc#DoubleQuoteOperator<cr>g@
vnoremap <leader>" :call vimrc#DoubleQuoteOperator(visualmode())<cr>

"" Single-quoting operator
nnoremap <leader>' :set operatorfunc=vimrc#SingleQuoteOperator<cr>g@
vnoremap <leader>' :call vimrc#SingleQuoteOperator(visualmode())<cr>
