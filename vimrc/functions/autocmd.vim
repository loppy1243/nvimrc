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
    exe 'normal! o\begin{' .  a:arg . "}\<cr>" . '\end{' . a:arg . "}\<esc>"
  else
    exe "normal! '<0" . a:m . "`>$c\\begin{" . a:arg . "}\<esc>gpO" . '\end{' . a:arg . "}\<esc>"
  endif
endfunc

func! NextOpeningParen()
  let l:hlstate = &hlsearch
  set hlsearch=0
  exe "normal! /(\<cr>"
  let &hlsearch = l:hlstate
endfunc

func! PrevOpeningParen()
  let l:hlstate = &hlsearch
  set hlsearch=0
  exe "normal! ?(\<cr>"
  let &hlsearch = l:hlstate
endfunc
