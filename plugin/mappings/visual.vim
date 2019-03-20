""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Visual Mode mappings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 'Strong' versions of the basic movements (far left, page up, etc.)
vnoremap H ^
vnoremap L $

"" Move by units delimited by whitespace
vnoremap <c-h> omb<esc>`<:call vimrc#MoveToPreviousChunk()<cr>
              \:exe 'normal! mc`b'.visualmode().'`c'<cr>
vnoremap <c-l> omb<esc>`>:call vimrc#MoveToNextChunk()<cr>
              \:exe 'normal! mc`b'.visualmode().'`c'<cr>
vnoremap <c-j> omb<esc>`>:call vimrc#MoveToNextBlock()<cr>
              \:exe 'normal! mc`b'.visualmode().'`c'<cr>
vnoremap <c-k> omb<esc>`<:call vimrc#MoveToPreviousBlock()<cr>
              \:exe 'normal! mc`b' . visualmode() . '`c'<cr>

" Indent
vnoremap <tab> >
" Dedent
vnoremap <space><tab> <

"" Commenting
vnoremap <expr> <leader>c '0<c-v>I' . b:comment_seq . '<esc>'
vnoremap <silent> <leader>C :<c-u>call vimrc#TmpLet('&hlsearch', 0)<cr>
                           \:exe 'silent! ''<,''>s/\V\^\('.escape(b:comment_seq, b:comment_esc)
                                \.'\)\+//'<cr>
                           \:nohlsearch<cr>
                           \:call vimrc#RestoreTmpLet('&hlsearch')<cr>

" Create a fold around the selected lines (assumes there's a comment on the
" first line). NOTE: This must end the Visual Mode section because it contains
" the fold marker. Also, the "{\{{" is to thwart vim from making a new fold.
vnoremap <leader>f <esc>ma'<$a <esc>:call vimrc#DashesForFold("{\{{")<cr>
                  \:exe 'normal! ''>o'.b:comment_seq '}}} '<cr>
                  \:call DashesForFold('(fold-marker)')<cr>'a

" Align the current selection to the mark specified
vnoremap <expr> <leader>a vimrc#AlignToMark(mode())

func! <SID>Format80()
  let l:tw = &l:textwidth
  let &l:textwidth = 80
  normal! `<v`>gq
  let &l:textwidth = l:tw
endfunc
vnoremap gQ :<c-u>call <SID>Format80()<cr>
