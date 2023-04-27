" vimrc
nnoremap <leader>ev <cmd>tab split $MYVIMRC<cr><cmd>exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>
nnoremap <leader>Ev <cmd>e $MYVIMRC<cr>:exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>
nnoremap <leader>EV <cmd>e $MYVIMRC<cr>:exe ':lcd' fnamemodify($MYVIMRC, ':h')<cr>

" snippets
nnoremap <leader>es <cmd>call <SID>QuickEditSnippets(v:true)<cr>
nnoremap <leader>Es <cmd>call <SID>QuickEditSnippets(v:false)<cr>
nnoremap <leader>ES <cmd>call <SID>QuickEditSnippets(v:false)<cr>
function! <SID>QuickEditSnippets(tab)
    if a:tab
        tab split
    endif

    let l:snippets_dir = fnamemodify($MYVIMRC, ':h') . '/luasnippets/'
    let l:snippets_prefix = l:snippets_dir . &l:filetype
    if isdirectory(l:snippets_prefix)
        exe 'lcd ' . l:snippets_prefix
        edit .
    else
        exe 'lcd ' . l:snippets_dir
        exe 'edit ' . &l:filetype . '.lua'
    endif
endfunction
