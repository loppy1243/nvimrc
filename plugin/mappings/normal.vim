""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Normal Mode mappings.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Ergonomics based on assumption that <localleader> is \

"" 'Strong' versions of the basic movements (far left, page up, etc.)
nnoremap H ^
nnoremap L $

"" Move by units delimited by whitespace
nnoremap <c-j> :call vimrc#MoveToNextBlock()<cr>
nnoremap <c-k> :call vimrc#MoveToPreviousBlock()<cr>

nnoremap <c-s-k> K
nnoremap J :call <SID>HalveLeft()<cr>
nnoremap K :call <SID>HalveRight()<cr>
func! <SID>HalveLeft()
    let l:start = getpos('.')
    normal! ^
    let l:end = getpos('.')

    let l:start[2] = l:end[2] + (l:start[2] - l:end[2])/2
    call setpos('.', l:start)
endfunc
func! <SID>HalveRight()
    let l:start = getpos('.')
    normal! $
    let l:end = getpos('.')

    let l:start[2] = l:start[2] + (l:end[2] - l:start[2])/2
    call setpos('.', l:start)
endfunc

" Join line to line below
nnoremap <leader>j J
" to line above
nnoremap <leader>k kJ

" Get rid of pesky highlighting
nnoremap <leader>nh :nohlsearch<cr>

" Indent
nnoremap <tab> >>
" Dedent.
nnoremap <s-tab> <<

" Newline below current
nnoremap <cr> o<esc>

"" Insert newline above
" For gvim
nnoremap <s-cr> O<esc>
" For vim

"" Very magic in searches
nnoremap / /\v
nnoremap ? ?\v

" Highlight trailing whitespace
nnoremap <leader>w :match ErrorMsg /\v\s+$/<cr>
" Unhighlight
nnoremap <leader>W :match<cr>
" Delete
nnoremap <leader>dw :%s/\v\s+$//<cr>

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
"nnoremap <localleader>ll :call b:make_file_f(expand('%'))<cr>

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

" Toggle color column
noremap <M-c> :call <SID>ToggleColorColumn(&l:textwidth+1, 81)<cr>

" Map jump forward to something usable
nnoremap <c-s-o> <c-i>

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

func! <SID>ToggleConcealLevel()
  if !exists('s:prev_cl')
    s:prev_cl = &l:conceallevel == 0 ? 2 : 0
  endif

  let l:prev_cl = &l:conceallevel
  if &l:conceallevel == 0
    let &l:conceallevel = s:prev_cl
  else
    let &l:conceallevel = 0
  endif
  let s:prev_cl = l:prev_cl
endfunc
nnoremap <M-o> :call <SID>ToggleConcealLevel()<cr>

func! <SID>ToggleTextwrap()
  if exists('b:prev_textwidth') && b:prev_textwidth != 0
    let &l:textwidth = b:prev_textwidth
    let b:prev_textwidth = 0
  else
    let b:prev_textwidth = &l:textwidth
    setlocal textwidth=0
  endif
endfunc
nnoremap <M-w> :call <SID>ToggleTextwrap()<cr>

func! <SID>ToggleFontSize()
  if !exists('s:fonttoggle')
    let s:fonttoggle = 0
  endif

  if s:fonttoggle
    exe 'GuiFont!' g:guifont.':h10'
  else
    exe 'GuiFont!' g:guifont.':h8'
  endif
  let s:fonttoggle = !s:fonttoggle
endfunc
nnoremap <M-f> :call <SID>ToggleFontSize()<cr>
