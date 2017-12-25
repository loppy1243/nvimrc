""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" These functions are used to implement mappings etc. that are dependent
""""" upon some autocmd.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call Include(g:vimrc_dir . '/variables.vim')

func! LatexMakeBlock(m, arg)
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

func! NextOpeningParen()
  let l:hlstate = &hlsearch
  set nohlsearch
  exe 'normal!' "/(\<cr>"
  nohlsearch
  let &hlsearch = l:hlstate
endfunc

func! PrevOpeningParen()
  let l:hlstate = &hlsearch
  set nohlsearch
  exe 'normal!' "?(\<cr>"
  nohlsearch
  let &hlsearch = l:hlstate
endfunc
