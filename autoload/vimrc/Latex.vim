func! vimrc#Latex#MakeBlock(m, arg)
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
