func! vimrc#Latex#MakeBlock(m, arg)
  if a:m == 'n'
    exe 'normal! $o\begin{' . a:arg . "}\<cr>" . '\end{' . a:arg . "}\<esc>O"
    startinsert
  elseif a:m == 'l'
    exe 'normal! a\begin{' . a:arg . "}\<esc>maa" . '\end{' . a:arg . "}\<esc>`al"
    startinsert
  elseif a:m == 'V' || a:m == ''
    exe "normal! '<0V`>$c\\begin{" . a:arg . "}\<esc>ma:pu\<esc>o" . '\end{' . a:arg . "}\<esc>`aj^"
  elseif a:m == 'v'
    exe "normal! `>a\\end{" . a:arg ."}\<esc>`<i\\begin{" . a:arg ."}\<esc>l"
  else
    echoerr 'Unknown mode in vimrc#Latex#MakeBlock'
  endif
endfunc
