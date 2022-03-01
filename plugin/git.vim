nnoremap <leader><leader><leader> :call vimrc#Git#Commit()<cr>
nnoremap <leader><leader><s-,> :call vimrc#Git#AmendCommit()<cr>
nnoremap <leader><leader><c-,> :call vimrc#Git#AmendCommitNoEdit()<cr>
"nnoremap <leader><leader>s :call vimrc#Git#Status()<cr>
nnoremap <leader><leader>s :!git status -bs<cr>
nnoremap <leader><leader>a :!git add %<cr><cr>:echo 'Added file to index:' expand('%')<cr>
nnoremap <leader><leader>A :!git add -u<cr><cr>:echo 'Updated index'<cr>
nnoremap <leader><leader>p :new<cr>:call termopen("git push")<cr>

""" Git difftool
nnoremap <leader><leader>d :GitDiff<cr>
nnoremap <leader><leader>D :GitDiff!<cr>

""" Git lg
nnoremap <leader><leader>l :exe 'GitLog '.expand('%')<cr>
nnoremap <leader><leader>L :exe 'GitLog! '.expand('%')<cr>
nnoremap <leader><leader><c-l> :GitLog<cr>

command! -complete=file -nargs=? -bang GitDiff call <SID>GitDiff(<q-args>, <bang>0)
function! <SID>GitDiff(file, bang)
    if a:file ==# ''
        if a:bang
            silent !git difftool -t nvimtab % &
        else
            silent !git difftool -t nvimnotab % &
        endif
    else
        if a:bang
            exe "silent !git difftool -t nvimtab '".a:file."' &"
        else
            exe "silent !git difftool -t nvimnotab '".a:file."' &"
        endif
    endif
endfunction

command! -nargs=? -bang GitLog call <SID>GitLog(<q-args>, <bang>0)
function! <SID>GitLog(file, bang)
    if a:bang
        tabnew
    else
        new
    endif

    silent! 0file
    file Git Log
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal bufhidden=wipe

    AnsiEsc
    if a:file ==# ''
        read !git lg --color
    else
        exe "read !git lg --color '".a:file."'"
    endif
    normal! ggdd

    setlocal nomodified
    setlocal nomodifiable
endfunction
