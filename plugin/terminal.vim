augroup Terminal
    au!
    au TermOpen * setlocal nonumber norelativenumber
augroup END

"" Open terminals
nnoremap <leader>S :call <SID>SplitTerm()<cr>
func! <SID>SplitTerm()
  if vimrc#SplitWindowInDirection()
    terminal
  endif
endfunc

nnoremap <localleader>s :call <SID>SplitTermopen(b:term_cmd)<cr>
func! <SID>SplitTermopen(cmd)
  let l:fty = &l:filetype
  if vimrc#SplitWindowInDirection()
    call termopen(a:cmd)
    if !get(g:repl_bufnr, l:fty, 0)
      let g:repl_bufnr[l:fty] = bufnr('%')
      exe 'au BufUnload <buffer> unlet g:repl_bufnr["'.l:fty.'"]'
    endif
  endif
endfunc
