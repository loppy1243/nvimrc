""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" These functions are used to implement mappings etc. that are dependent
""""" upon some autocmd.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call Include(g:vimrc_dir . '/variables.vim')

"" Mappings that somehow depend on a Filetype autocmd
func! FiletypeAUDependentMappings()
  """ Abbreviations
  exe 'iabbrev <buffer> ' . b:comment_seq . "--> " . repeat(b:comment_seq, 80)
endfunc

func! LatexMakeBlock(m, arg)
  if a:m == 'n'
    exe! 'normal! O' .\
         '\begin{' . a:arg . "}<cr>\end{" . a:arg . '}' .\
         "<esc>O<esc>"
  elseif
    exe! 'normal! `<' . a:m . '`>dO' .\
         '\begin{' . a:arg . "}<cr><esc>po\end{" . a:arg . '}' .\
         "<esc>"
  endif
endfunc
