function! s:getCursorChar()
    return getline('.')[col('.') - 1]
endfunction

function! <SID>upBraceMove()
    if !(s:getCursorChar() =~# '[([{]')
        normal! [(
    endif

    let l:cursor = [line('.'), col('.')]
    call search('[()[\]{}]', 'b')
    if s:getCursorChar() =~# '[([{]'
        call cursor(l:cursor)
    else
        normal! %
    endif
endfunction

function! <SID>downBraceMove()
    if !(s:getCursorChar() =~# '[([{]')
        normal! [(
    endif

    let l:cursor = [line('.'), col('.')]
    normal! %

    call search('[()[\]{}]')
    if s:getCursorChar() =~# '[)\]}]'
        call cursor(l:cursor)
    endif
endfunction

func! vimrc#Lisp#Setup()
  let b:comment_seq = ';'
  let b:comment_esc = ''
  nnoremap <buffer> [[ :call vimrc#Lisp#PrevOpeningParen()<cr>
  nnoremap <buffer> ][ :call vimrc#Lisp#NextOpeningParen()<cr>

  inoremap <buffer> ( ()<Left>
  inoremap <buffer> [ []<Left>
  inoremap <buffer> { {}<Left>
  inoremap <buffer> " ""<Left>
  inoremap <buffer> <s-backspace> <space><esc>hmA%x`Axa<backspace>

  nnoremap <buffer> <c-h> :call search('\([()[\]{}]\)\1*', 'b')<cr>
  nnoremap <buffer> <c-l> :call search('\([()[\]{}]\)\1*')<cr>
  nnoremap <buffer> <c-j> :call <SID>downBraceMove()<cr>
  nnoremap <buffer> <c-k> :call <SID>upBraceMove()<cr>

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
