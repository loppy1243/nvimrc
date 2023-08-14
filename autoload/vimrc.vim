"" Inserts dashes so that end_str is flush against column 80. Assumes that the
"" cursor is at the end of the line.
"" Note: Could handle bad cases, but I'm lazy.
func! vimrc#DashesForFold(end_str)
  if col('.') < 80
    let l:num_dashes = 80 - col('.') - strlen(a:end_str) - 1
    
    let l:tmp = &l:textwidth
    setlocal textwidth=0
    exe 'normal! a'.repeat('-', l:num_dashes) a:end_str
    let &l:textwidth = l:tmp
  else
    " TODO, if ever
  endif
endfunc

func! vimrc#SplitWindowInDirection(...)
  if a:0 > 1
    echoerr 'Expected at most 1 argument, received '.a:0
    return 0
  elseif a:0 ==# 1
    let l:c = a:0
  else
    let l:c = vimrc#InputCharTimeout()
    if l:c is 0
      return 0
    endif
  endif

  if l:c ==? 'h'
    leftabove vnew
  elseif l:c ==? 'l'
    rightbelow vnew
  elseif l:c ==? 'j'
    belowright new
  elseif l:c ==? 'k'
    aboveleft new
  endif

  return 1
endfunc

"" Swaps the current window with the window placed in the h/j/k/l direction
"" dir.
func! vimrc#SwapWindowInDirection(...)
  if a:0 > 1
    echoerr 'Expected at most 1 argument, received '.a:0
  elseif a:0 ==? 1
    let l:dir = a:0
  else
    let l:dir = vimrc#InputCharTimeout()
    if l:dir is 0
      return
    endif
  endif

  let l:prev_win_num = winnr()
  exe "normal! \<c-w>".l:dir
  exe 'normal!' l:prev_win_num."\<c-w>x"
endfunc

"" Move the cursor to the next non-whitespace character on the line
func! vimrc#MoveToNextChunk()
  let l:prev_line = line('.')

  normal! maW
  if line('.') != l:prev_line
    normal! 'ag_
  endif
endfunc

"" Move the cursor to the previous character that begins a non-whitespace
"" chunk on the same line.
func! vimrc#MoveToPreviousChunk()
  let l:prev_line = line('.')

  normal! maB
  if line('.') != l:prev_line
    normal! 'a^
  endif
endfunc

"" Move the cursor to the beginning of the next block of non-whitespace/blank
"" lines.
func! vimrc#MoveToNextBlock()
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
func! vimrc#MoveToPreviousBlock()
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

func! vimrc#InputChar(...)
  let l:c = call('getchar', a:000)

  if type(l:c) ==# v:t_number
    return l:c == 0 ? 0 : nr2char(l:c)
  else
    return l:c
  endif
endfunc

func! vimrc#InputCharTimeout()
  let l:t = reltime()

  while !getchar(1) && reltimefloat(reltime(l:t))*1.0e3 < &timeoutlen
  endwhile

  return vimrc#InputChar(0)
endfunc

"" Move everything past the cursor from its current position to the column of the specified mark
func! vimrc#AlignToMark(mode_str)
  let l:mark = vimrc#InputChar()
  let l:mark_col = col("'".l:mark)

  if a:mode_str ==# 'n'
    exe 'normal! i'.repeat(' ', l:mark_col - col('.'))."\<esc>l"
  elseif a:mode_str ==# 'V'
    return "\<esc>'<'>I".repeat(' ', l:mark_col - 1)."\<esc>"
  elseif a:mode_str ==# ''
    return "I".repeat(' ', l:mark_col - col("'<"))."\<esc>"
  else
    echom 'Invalid mode for AlignToMark!'
  endif
endfunc


let s:tmplet_cache = {}

"" Expand str as if it were expanded by map; as such, str should contain no
"" whitespace.
"" FIXME, DOES NOT WORK PROPERLY
func! vimrc#MapExpand(str)
  let l:prev_mapping = maparg(a:str, 'n')
  exe 'nnoremap' a:str a:str
  let l:ret = maparg(a:str, 'n')

  if l:prev_mapping ==# ''
    exe 'nunmap' a:str
  else
    exe 'nnoremap' a:str l:prev_mapping
  endif

  return l:ret
endfunc

func! vimrc#SingleQuote(str)
  return "'".substitute(a:str, "'", "''", 'g')."'"
endfunc

"" Temporary let. Only works for global, script, and option variables.
func! vimrc#TmpLet(var, val)
  exe "let s:tmplet_cache['".a:var."'] =" a:var
  exe 'let' a:var '= a:val'
endfunc

"" Restore Temporary Let
func! vimrc#RestoreTmpLet(var)
  exe 'let '.a:var." = s:tmplet_cache['".a:var."']"
  exe "unlet s:tmplet_cache['".a:var."']"
endfunc


func! vimrc#DoubleQuoteOperator(type)
  if a:type ==# 'char'
    exe "normal! `[v`]\<esc>`<i\"\<esc>`>la\"\<esc>"
  elseif a:type ==# 'line'
    exe "normal! '[0V']$\<esc>`<i\"\<esc>`>a\"\<esc>"
  elseif a:type ==# 'v'
    exe "normal! `<v`>\<esc>`<i\"\<esc>`>la\"\<esc>"
  elseif a:type ==# 'V'
    " TODO
  elseif a:type ==# "\<c-v>"
    " TODO
  else
    echom 'The world has ended.'
  endif
endfunc

func! vimrc#SingleQuoteOperator(type)
  if a:type ==# 'char'
    exe "normal! `[v`]\<esc>`<i'\<esc>`>la'\<esc>"
  elseif a:type ==# 'line'
    exe "normal! '[0V']$\<esc>`<i'\<esc>`>a'\<esc>"
  elseif a:type ==# 'v'
    exe "normal! `<i'\<esc>`>la'\<esc>"
  elseif a:type ==# 'V'
    " TODO
  elseif a:type ==# "\<c-v>"
    " TODO
  else
    echom 'The world has ended.'
  endif
endfunc

func! s:ModifiedMakeFile(file)
  exe 'write '.b:backing_file
  call b:prev_make_file_f(b:backing_file)
endfunc

func! vimrc#OpenMemo(...)
  if a:0 > 2
    echoerr 'Expected at most 2 arguments, received '.a:0
  elseif a:0 >= 1
    let l:name = a:1
  else
    let l:name = 'default'
  endif

  if a:0 == 2
    let l:name = 'memo://'.l:name.'.'.a:2
  else
    let l:name = 'memo://'.l:name
  endif

  if !bufexists(l:name)
    exe 'badd' l:name
    let l:bufnr = bufnr(l:name)

    if a:0 == 2
      let l:f = tempname()

      call setbufvar(l:bufnr, '&filetype', a:2)
      call setbufvar(l:bufnr, 'backing_file', l:f)

      exe 'au BufDelete,BufWipeout <buffer='.l:bufnr.'> !rm -f '.l:f

      let Prev_make_file_f = getbufvar(l:bufnr, 'make_file_f')
      if Prev_make_file_f !=# ''
        call setbufvar(l:bufnr, 'prev_make_file_f', Prev_make_file_f)
        call setbufvar(l:bufnr, 'make_file_f', funcref('s:ModifiedMakeFile'))
      endif
    else
      call setbufvar(l:bufnr, '&filetype', 'memo')
    endif
  endif
  let l:bufnr = bufnr(l:name)

  " If open in the current tab, go to that; if open but not in current tab, go to the first in
  " the win_findbuf list.
  if bufloaded(l:name)
    let l:tabwins = map(win_findbuf(bufnr(l:name)), 'win_id2tabwin(v:val)')

    for l:tabwin in l:tabwins
      if l:tabwin[0] == tabpagenr()
        exe l:tabwin[1].'wincmd w'
        return
      endif
    endfor

    exe l:tabwins[0][0].'tabnext'
    exe l:tabwins[0][1].'wincmd w'

  " If not open and we're in a new buffer, open it there
  elseif bufname('%') ==# ''
    exe 'buffer '.l:bufnr

  " Else open it in a new tab
  else
    exe 'tab split' l:name
  endif
endfunc

func! vimrc#ReplEval(buf, text)
  let l:cmd = extend(a:text, [''])

  let l:id = getbufvar(a:buf, 'terminal_job_id', -1)
  if l:id == -1
    echoerr 'no b:terminal_job_id associated with ['.a:buf.']' bufname(a:buf)
    return
  endif

  call jobsend(l:id, l:cmd)
endfunc

func! vimrc#CmdHere(bang, cmd)
  let @a=substitute(system(a:cmd), '\n\+$', '', '')
  if a:bang ==# '!'
    let l:mode = 'a'
  else
    let l:mode = 'i'
  endif

  exe 'normal! '.l:mode."\<c-R>a"
endfunc

function! vimrc#SetVimgrepPattern(...)
  if a:0 == 0
    let g:vimgrep_default_pattern = '**'
  elseif a:0 == 1
    let g:vimgrep_default_pattern = a:1
  else
    echoerr "IMPOSSIBLE"
  endif
endfunction
