""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Visual Mode mappings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call Include(g:vimrc_dir . '/variables.vim')
call Include(g:vimrc_dir . '/functions/mappings.vim')

"" 'Strong' versions of the basic movements (far left, page up, etc.)
vnoremap H ^
vnoremap L $
vnoremap J <c-f>
vnoremap K <c-b>

"" Move by units delimited by whitespace
"" FIXME: Opposite action cancels the first.
vnoremap <c-h> omb<esc>`<:call MoveToPreviousChunk()<cr>:exe 'normal! mc`b' . visualmode() . '`c'<cr>
vnoremap <c-l> omb<esc>`>:call MoveToNextChunk()<cr>:exe 'normal! mc`b' . visualmode() . '`c'<cr>
vnoremap <c-j> omb<esc>`>:call MoveToNextBlock()<cr>:exe 'normal! mc`b' . visualmode() . '`c'<cr>
vnoremap <c-k> omb<esc>`<:call MoveToPreviousBlock()<cr>:exe 'normal! mc`b' . visualmode() . '`c'<cr>

" Indent
vnoremap <tab> >
" Dedent.
vnoremap <space><tab> <

"" Commenting
vnoremap <expr> <leader>c '0<c-v>I' . b:comment_seq . ' <esc>'
vnoremap <silent> <leader>C :<c-u>call TmpLet('&hlsearch', 0)<cr>:exe 'silent! ''<,''>s/\V\^\(' . b:comment_seq . '\)\+ //'<cr>:nohlsearch<cr>:call RestoreTmpLet('&hlsearch')<cr>

" Create a fold around the selected lines (assumes there's a comment on the
" first line). NOTE: This must end the Visual Mode section because it contains
" the fold marker. Also, the "{\{{" is to thwart vim from making a new fold.
vnoremap <leader>f <esc>ma'<$a <esc>:call DashesForFold("{\{{")<cr>:exe 'normal! ''>o' . b:comment_seq . ' }}} '<cr>:call DashesForFold('(fold-marker)')<cr>'a

" Align the current selection to the mark specified
vnoremap <expr> <leader>a AlignToMark(mode())

