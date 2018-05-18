func! vimrc#Lisp#Setup()
  let b:comment_seq = ';'
  let b:comment_esc = ''
  nnoremap <buffer> [[ :call vimrc#Lisp#PrevOpeningParen()<cr>
  nnoremap <buffer> ][ :call vimrc#Lisp#NextOpeningParen()<cr>

  let g:rainbow#pairs = [['(', ')'], ['[', ']']]
  RainbowParentheses
endfunc

func! vimrc#Lisp#NextOpeningParen()
  let l:hlstate = &hlsearch
  set nohlsearch
  exe 'normal!' "/(\<cr>"
  nohlsearch
  let &hlsearch = l:hlstate
endfunc

func! vimrc#Lisp#PrevOpeningParen()
  let l:hlstate = &hlsearch
  set nohlsearch
  exe 'normal!' "?(\<cr>"
  nohlsearch
  let &hlsearch = l:hlstate
endfunc
