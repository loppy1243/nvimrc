""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Normal Mode mappings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Ergonomics based on assumption that <localleader> is \

"" 'Strong' versions of the basic movements (far left, page up, etc.)
nnoremap H ^
nnoremap L $
"nnoremap J <c-f>
"nnoremap K <c-b>

"" Move by units delimited by whitespace
" Removed and replaced further down.
"nnoremap <c-h> :call vimrc#MoveToPreviousChunk()<cr>
"nnoremap <c-l> :call vimrc#MoveToNextChunk()<cr>
nnoremap <c-j> :call vimrc#MoveToNextBlock()<cr>
nnoremap <c-k> :call vimrc#MoveToPreviousBlock()<cr>

" Join line to line below
nnoremap <leader>j J
" to line above
nnoremap <leader>k kJ

" Edit MYVIMRC
nnoremap <leader>ev :tab split $MYVIMRC<cr>:exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>
nnoremap <leader>Ev :e $MYVIMRC<cr>:exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>
nnoremap <leader>EV :e $MYVIMRC<cr>:exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>

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
nnoremap <silent> <leader>C :call vimrc#TmpLet('&hlsearch', 0)<cr>
                           \:exe ':silent! s/\V\^\('.escape(b:comment_seq, b:comment_esc)
                                \.'\)\+//'<cr>
                           \:nohlsearch<cr>
                           \:call vimrc#RestoreTmpLet('&hlsearch')<cr>

" Convenient mark jump
nnoremap MM 'm

" Column align to column of specified mark from current position
nnoremap <leader>a :call vimrc#AlignToMark('n')<cr>

"" Open terminals
nnoremap <leader>S :call <SID>SplitTerm()<cr>
func! <SID>SplitTerm()
  if vimrc#SplitWindowInDirection()
    terminal
    setlocal nonumber
  endif
endfunc

nnoremap <localleader>s :call <SID>SplitTermopen(b:term_cmd)<cr>
func! <SID>SplitTermopen(cmd)
  let l:fty = &l:filetype
  if vimrc#SplitWindowInDirection()
    call termopen(a:cmd)
    if !get(g:repl_bufnr, l:fty, 0)
      let g:repl_bufnr[l:fty] = bufnr('%')
      setlocal nonumber
      exe 'au BufUnload <buffer> unlet g:repl_bufnr["'.l:fty.'"]'
    endif
  endif
endfunc

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
"nnoremap <leader>ss :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<cr>
nnoremap <leader>sS :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>

" Source current file
nnoremap <leader>ss :so %<cr>

func! <SID>EvalMotion(mode, ...)
  if a:0 > 1
    echoerr 'Expected at most 1 argument, found' a:0
  elseif a:0 == 1
    exe 'normal! `<'.a:1.'`>y'
  else
    if a:mode ==# 'line'
      let l:v = 'V'
    elseif a:mode ==# 'char'
      let l:v = 'v'
    elseif a:mode ==# 'block'
      let l:v = ''
    else
      echoerr 'Unexpected mode'
    endif

    exe 'normal! `['.l:v.'`]y'
  endif

  call b:repl_eval_f(s:eval_motion_bufnr ? s:eval_motion_bufnr : g:repl_bufnr[&l:filetype],
                    \getreg('"', 1, 1))
endfunc
func! <SID>SetEvalMotionBufnr()
  let s:eval_motion_bufnr = v:count
endfunc
nnoremap <localleader><localleader> :call <SID>SetEvalMotionBufnr()<cr>
                                   \:set operatorfunc=<SID>EvalMotion<cr>g@
nnoremap <localleader><localleader><localleader> :call <SID>SetEvalMotionBufnr()<cr>
                                                \^m[$m]:call <SID>EvalMotion('line')<cr>
vnoremap <localleader><localleader> :<c-u>call <SID>SetEvalMotionBufnr()<cr>
                                   \:call <SID>EvalMotion('visual', visualmode())<cr>

nnoremap \|\| :call b:run_file_f(expand('%'))<cr>
nnoremap <localleader>ll :call b:make_file_f(expand('%'))<cr>

" Makes this available
nnoremap <c-`> `

" Cached f/F/t/T
func! <SID>CachedF(command, cache)
  if a:cache
    let s:cached_char = vimrc#InputChar()
  elseif !exists('s:cached_char')
    let s:cached_char = "\<esc>"
  endif

  exe 'normal!' a:command.s:cached_char
endfunc
nnoremap f :call <SID>CachedF('f', 1)<cr>
nnoremap F :call <SID>CachedF('F', 1)<cr>
nnoremap t :call <SID>CachedF('t', 1)<cr>
nnoremap T :call <SID>CachedF('T', 1)<cr>
nnoremap <c-h> :call <SID>CachedF('F', 0)<cr>
nnoremap <c-l> :call <SID>CachedF('f', 0)<cr>

" Convenient tab moving
nnoremap <M-h> :tabN<cr>
nnoremap <M-l> :tabn<cr>

" Non-clobbering :only mapping
nnoremap <c-w>o :tab split<cr>
nmap <c-w><c-o> <c-w>o

func! <SID>ToggleColorColumn(v1, v2)
  if &l:colorcolumn ==# ''
    let &l:colorcolumn = a:v1
  elseif !exists('s:colorcol_prev')
    let s:colorcol_prev = a:v1
    let &l:colorcolumn = a:v2
  else
    let l:tmp = &l:colorcolumn
    let &l:colorcolumn = s:colorcol_prev
    let s:colorcol_prev = l:tmp
  endif
endfunc

noremap <M-c> :call <SID>ToggleColorColumn(&l:textwidth+1, 81)<cr>
