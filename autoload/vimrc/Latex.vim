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

command! -nargs=1 vimrc#Latex#MakeBlockNormal call vimrc#Latex#MakeBlock('n', <f-args>)
command! -nargs=1 vimrc#Latex#MakeBlockVisual call vimrc#Latex#MakeBlock(visualmode(), <f-args>)
command! -nargs=1 vimrc#Latex#MakeBlockInline call vimrc#Latex#MakeBlock('l', <f-args>)
