On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   plugin/mappings/normal.vim

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.VimballRecord
	.netrwhist

no changes added to commit (use "git add" and/or "git commit -a")
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Normal Mode mappings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 'Strong' versions of the basic movements (far left, page up, etc.)
nnoremap H ^
nnoremap L $
"nnoremap J <c-f>
"nnoremap K <c-b>

"" Move by units delimited by whitespace
nnoremap <c-h> :call vimrc#MoveToPreviousChunk()<cr>
nnoremap <c-l> :call vimrc#MoveToNextChunk()<cr>
nnoremap <c-j> :call vimrc#MoveToNextBlock()<cr>
nnoremap <c-k> :call vimrc#MoveToPreviousBlock()<cr>

" Join line to line below
nnoremap <leader>j J
" to line above
nnoremap <leader>k kJ

" Edit MYVIMRC
nnoremap <leader>ev :tab split $MYVIMRC<cr>:exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>
nnoremap <leader>Ev :e $MYVIMRC<cr>:exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>
nmap <leader>EV :e $MYVIMRC<cr>:exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>

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

"" Split a window to the left, right, up, and down
nnoremap <leader>s :call vimrc#SplitWindowInDirection()<cr>

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
nnoremap <c-w>s :call vimrc#SwapWindowInDirection()<cr>

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
nnoremap <silent> <leader>C :call vimrc#TmpLet('&hlsearch', 0)<cr>:exe ':silent! s/\V\^\(' . escape(b:comment_seq, b:comment_esc) . '\)\+//'<cr>:nohlsearch<cr>:call vimrc#RestoreTmpLet('&hlsearch')<cr>

" Convenient mark jump
nnoremap MM 'm

" Column align to column of specified mark from current position
nnoremap <leader>a :call vimrc#AlignToMark('n')<cr>

"" Open terminals
" FIXME: make work with SplitWindowInDirection
nnoremap <leader>Sh :leftabove vnew<cr>:terminal<cr>
nnoremap <leader>Sl :rightbelow vnew<cr>:terminal<cr>
nnoremap <leader>Sj :belowright new<cr>:terminal<cr>
nnoremap <leader>Sk :aboveleft new<cr>:terminal<cr>

nnoremap <leader>SH :leftabove vnew<cr>:terminal<cr>
nnoremap <leader>SL :rightbelow vnew<cr>:terminal<cr>
nnoremap <leader>SJ :belowright new<cr>:terminal<cr>
nnoremap <leader>SK :aboveleft new<cr>:terminal<cr>

nnoremap <localleader>sh :leftabove vnew<cr>:call termopen(g:term_cmd)<cr>
nnoremap <localleader>sl :rightbelow vnew<cr>:call termopen(g:term_cmd)<cr>
nnoremap <localleader>sj :belowright new<cr>:call termopen(g:term_cmd)<cr>
nnoremap <localleader>sk :aboveleft new<cr>:call termopen(g:term_cmd)<cr>

"" Delete the surrounding brackets.
nnoremap <leader>d( ma[(mb])x`bx`a
nnoremap <leader>d{ ma[{mb]}x`bx`a
nnoremap <leader>d[ mava[<esc>x`<x`a
nnoremap <leader>d< mava<<esc>x`<x`a

nnoremap <leader>d) ma[(mb])x`bx`a
nnoremap <leader>d} ma[{mb]}x`bx`a
nnoremap <leader>d] mava[<esc>x`<x`a
nnoremap <leader>d> mava<<esc>x`<x`a

"" Show syntax items under the cursor.
nnoremap <leader>ss :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<cr>
nnoremap <leader>sS :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>

"" Git mappings
nnoremap <leader><leader><leader> :!git commit<cr>
nnoremap <leader><leader>s :call vimrc#Git#Status()<cr>
