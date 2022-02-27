augroup EmptyBuffers
    au!
    au BufHidden * call <SID>WipeLonelyBufIfEmpty(expand('<abuf>'))
augroup END

function! <SID>WipeLonelyBufIfEmpty(bufnr)
    if bufname(str2nr(a:bufnr)) ==# '' && !&l:modified
        call timer_start(100, {_ -> execute('silent! bw! '.a:bufnr)})
    endif
endfunction
