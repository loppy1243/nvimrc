""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Normal Mode mappings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call Include(g:vimrc_dir . '/variables.vim')
call Include(g:vimrc_dir . '/functions/mappings.vim')
call Include(g:vimrc_dir . '/functions/misc.vim')

"" 'Strong' versions of the basic movements (far left, page up, etc.)
nnoremap H ^
nnoremap L $
nnoremap J <c-f>
nnoremap K <c-b>

"" Move by units delimited by whitespace
nnoremap <c-h> :call MoveToPreviousChunk()<cr>
nnoremap <c-l> :call MoveToNextChunk()<cr>
nnoremap <c-j> :call MoveToNextBlock()<cr>
nnoremap <c-k> :call MoveToPreviousBlock()<cr>

" Join line to line below
nnoremap <leader>j J
" to line above
nnoremap <leader>k kJ

" Edit MYVIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source it
nnoremap <leader>sv :source $MYVIMRC<cr>

" Get rid of pesky highlighting
nnoremap <leader>nh :nohlsearch<cr>

" Indent
nnoremap <tab> >>
" Dedent.
nnoremap <space><tab> <<

" Newline below current
nnoremap <cr> o<esc>

"" Insert newline above
" For gvim
nnoremap <s-cr> O<esc>
" For vim

" Move line down
nnoremap <leader>mj dd$p
" Up
nnoremap <leader>mk :exe 'normal! dd' . (line('.') - 1) . 'G0P'<cr>

"" Split a window to the left, right, up, and down, respectively
nnoremap <leader>sh :leftabove vnew<cr>
nnoremap <leader>sl :rightbelow vnew<cr>
nnoremap <leader>sj :belowright new<cr>
nnoremap <leader>sk :aboveleft new<cr>

"" Very magic in searches
nnoremap / /\v
nnoremap ? ?\v

" Highlight trailing whitespace
nnoremap <leader>w :match ErrorMsg /\v\s+$/<cr>
" Unhighlight
nnoremap <leader>W :match<cr>
" Delete
nnoremap <leader>dw :%s/\v\s+$//<cr>

"" Swap windows in the h,j,k,l directions
nnoremap <c-w>sh :call SwapWindowInDirection('h')<cr>
nnoremap <c-w>sj :call SwapWindowInDirection('j')<cr>
nnoremap <c-w>sk :call SwapWindowInDirection('k')<cr>
nnoremap <c-w>sl :call SwapWindowInDirection('l')<cr>

" Quick macro access; uses macro 'q'.
nnoremap > @q

" Quickly swap between current and previously selected buffer
nnoremap ` :exe 'buffer ' . bufnr('#')<cr>
" Next buffer.
nnoremap ~ :bn<cr>
" Previous buffer.
nnoremap <m-~> :bN<CR>

"" Commenting
nnoremap <expr> <leader>c 'gI' . b:comment_seq . '<esc>'
" Uncomment
nnoremap <silent> <leader>C :call TmpLet('&hlsearch', 0)<cr>:exe ':silent! s/\V\^\(' . escape(b:comment_seq, b:comment_esc) . '\)\+//'<cr>:nohlsearch<cr>:call RestoreTmpLet('&hlsearch')<cr>

" Convenient mark jump
nnoremap MM 'm

" Column align to column of specified mark from current position
nnoremap <leader>a :call AlignToMark('n')<cr>

"" Conque mappings
"" Generate windows
nnoremap <leader>Sh :lefabove vnew<cr>:ConqueTerm zsh<cr>
nnoremap <leader>Sl :rightbelow vnew<cr>:ConqueTerm zsh<cr>
nnoremap <leader>Sj :belowright new<cr>:ConqueTerm zsh<cr>
nnoremap <leader>Sk :aboveleft new<cr>:ConqueTerm zsh<cr>

"" Delete the surrounding brackets.
nnoremap <leader>d( ma[(mb])x`bx`a
nnoremap <leader>d{ ma[{mb]}x`bx`a
nnoremap <leader>d[ mava[<esc>`<x`>x`a
nnoremap <leader>d< mava<<esc>`<x`>x`a

nnoremap <leader>d) ma[(mb])x`bx`a
nnoremap <leader>d} ma[{mb]}x`bx`a
nnoremap <leader>d] mava[<esc>`<x`>x`a
nnoremap <leader>d> mava<<esc>`<x`>x`a
