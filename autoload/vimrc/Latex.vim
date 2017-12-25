func! Latex#MakeBlock(m, arg)
  if a:m == 'n'
    exe 'normal! $a\begin{' . a:arg . "}\<cr>" . '\end{' . a:arg . "}\<esc>O"
    startinsert
  elseif a:m == 'l'
    exe 'normal! a\begin{' . a:arg . "}  \<esc>maa" . '\end{' . a:arg . "}\<esc>`a"
    startinsert
  else
    exe "normal! '<0" . a:m . "`>$c\\begin{" . a:arg . "}\<esc>gpO" . '\end{' . a:arg . "}\<esc>"
  endif
endfunc

command! -nargs=1 Latex#MakeBlockNormal call Latex#MakeBlock('n', <f-args>)
command! -nargs=1 Latex#MakeBlockVisual call Latex#MakeBlock(visualmode(), <f-args>)
command! -nargs=1 Latex#MakeBlockInline call Latex#MakeBlock('l', <f-args>)
