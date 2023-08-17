nnoremap <leader><leader><leader> :call vimrc#Git#Commit()<cr>
nnoremap <leader><leader>< :call vimrc#Git#AmendCommit()<cr>
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
            silent !git difftool -t nvimtab -- % &
        else
            silent !git difftool -t nvimnotab -- % &
        endif
    else
        if a:bang
            exe "silent !git difftool -t nvimtab -- '".a:file."' &"
        else
            exe "silent !git difftool -t nvimnotab -- '".a:file."' &"
        endif
    endif
endfunction

command! -nargs=0 DiffClose call <SID>DiffClose()
function! <SID>DiffClose()
    let l:cur_buf = bufnr()
    for l:buf in tabpagebuflist()
        if l:buf !=# l:cur_buf && getbufvar(l:buf, '&diff')
            execute 'bd ' . l:buf
        endif
    endfor
endfunction

command! -nargs=+ GitDiffCmdTab call <SID>GitDiffCmd(v:true, <f-args>)
command! -nargs=+ GitDiffCmdNoTab call <SID>GitDiffCmd(v:false, <f-args>)
function! <SID>GitDiffCmd(tab, ...)
    call assert_true(a:0 !=# 2, "expected two file names")
    let l:local = a:1
    let l:remote = a:2

    if a:tab
        exe 'tabedit ' . l:local
    else
        exe 'edit ' . l:local
    endif

    diffthis
    setlocal ro
    setlocal bufhidden=delete
    exe 'vert diffsplit ' . l:remote
    setlocal noro

    if a:tab
        nnoremap <buffer> <leader><leader>d <cmd>nunmap <buffer> <leader><leader>d<cr><cmd>tabclose<cr>
    else
        nnoremap <buffer> <leader><leader>d <cmd>nunmap <buffer> <leader><leader>d<cr><cmd>DiffClose<cr>
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
