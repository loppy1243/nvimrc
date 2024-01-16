nnoremap <m-s-k> K
nnoremap <c-m-s-k> :LookupKeyword<space>

command! LookupKeyword -args=1 call s:LookupKeyword(<q-args>)

augroup myman
  au!
  au Filetype man call s:ManSetup()
augroup END

func! s:ManSetup()
  setlocal buftype=nofile
  setlocal nonumber
  setlocal colorcolumn=0
endfunc

function! s:LookupKeyword(word)
  if exists('b:lookup_func')
    call b:lookup_func(a:word)
  else
    split
    exe 'split terminal '..&l:keywordprg.." '"..a:word.."'"
  endif
endfunction
