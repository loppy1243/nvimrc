func! Lisp#NextOpeningParen()
  let l:hlstate = &hlsearch
  set nohlsearch
  exe 'normal!' "/(\<cr>"
  nohlsearch
  let &hlsearch = l:hlstate
endfunc

func! Lisp#PrevOpeningParen()
  let l:hlstate = &hlsearch
  set nohlsearch
  exe 'normal!' "?(\<cr>"
  nohlsearch
  let &hlsearch = l:hlstate
endfunc
