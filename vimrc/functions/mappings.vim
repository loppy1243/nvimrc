"" Inserts dashes so that end_str is flush against column 80. Assumes that the
"" cursor is at the end of the line.
"" Note: Could handle bad cases, but I'm lazy.
func! DashesForFold(end_str)
  if col('.') < 80
    let l:num_dashes = 80 - col('.') - strlen(a:end_str) - 1
    
    let l:tmp = &l:textwidth
    setlocal textwidth=0
    exe 'normal! a' . repeat('-', l:num_dashes) . ' ' . a:end_str
    let &l:textwidth = l:tmp
  else
    " TODO, if ever
  endif
endfunc

"" Swaps the current window with the window placed in the h/j/k/l direction
"" dir.
func! SwapWindowInDirection(dir)
  let l:prev_win_num = winnr()
  exe "normal! \<c-w>" . a:dir
  exe 'normal! ' . l:prev_win_num . "\<c-w>x"
endfunc

"" Move the cursor to the next non-whitespace character on the line
func! MoveToNextChunk()
  let l:prev_line = line('.')

  normal! maW
  if line('.') != l:prev_line
    normal! 'ag_
  endif
endfunc

"" Move the cursor to the previous character that begins a non-whitespace
"" chunk on the same line.
func! MoveToPreviousChunk()
  let l:prev_line = line('.')

  normal! maB
  if line('.') != l:prev_line
    normal! 'a^
  endif
endfunc

"" Move the cursor to the beginning of the next block of non-whitespace/blank
"" lines.
func! MoveToNextBlock()
  let l:prev_col = col('.')
  let l:prev_line = line('.')
  let l:tmp = &hlsearch

  set nohlsearch

"" WOW I wish I had commented this when I'd known what it does.
  exe "silent! normal! /\\v^\\s*$\<cr>/\\v\\S\<cr>"

  if line('.') < l:prev_line
    call setpos('.', [0, l:prev_line, l:prev_col, 0])
  else
    call setpos('.', [0, line('.'), l:prev_col, 0])
  endif

  let &hlsearch = l:tmp
endfunc

"" Move the cursor to the beginning of the previous block of
"" non-whitespace/blank lines.
func! MoveToPreviousBlock()
  let l:prev_col = col('.')
  let l:prev_line = line('.')
  let l:tmp = &hlsearch

  set nohlsearch

"" (O_O)...
  exe "silent! normal! ?\\v^\\s*$\<cr>?\\v^\\s*$\<cr>/\\v\\S\<cr>"

  if line('.') > l:prev_line
    call setpos('.', [0, l:prev_line, l:prev_col, 0])
  else
    call setpos('.', [0, line('.'), l:prev_col, 0])
  endif

  let &hlsearch = l:tmp
endfunc

func! InputChar()
  let l:c = getchar()

  return type(l:c) == type(0) ? nr2char(l:c) : l:c
endfunc

"" Move everything past the cursor from its current position to the column of the specified mark
func! AlignToMark(mode_str)
  let l:mark = InputChar()
  let l:mark_col = col("'" . l:mark)

  if a:mode_str == 'n'
    exe 'normal! i' . repeat(' ', l:mark_col - col('.')) . "\<esc>l"
  elseif a:mode_str == 'V'
    return "\<esc>'<'>I" . repeat(' ', l:mark_col - 1) . "\<esc>"
  elseif a:mode_str == ''
    return "I" . repeat(' ', l:mark_col - col("'<")) . "\<esc>"
  else
    echom 'Invalid mode for AlignToMark!'
  endif
endfunc
