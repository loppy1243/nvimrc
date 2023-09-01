nnoremap <leader><leader><leader> :call vimrc#Git#Commit()<cr>
nnoremap <leader><leader>< :call vimrc#Git#AmendCommit()<cr>
nnoremap <leader><leader><c-,> :call vimrc#Git#AmendCommitNoEdit()<cr>
"nnoremap <leader><leader>s :call vimrc#Git#Status()<cr>
nnoremap <leader><leader>s :!git status -bs<cr>
nnoremap <leader><leader>a :!git add %<cr><cr>:echo 'Added file to index:' expand('%')<cr>
nnoremap <leader><leader>A :!git add -u<cr><cr>:echo 'Updated index'<cr>
nnoremap <leader><leader>p :new<cr>:call termopen("git push")<cr>

""" Git lg
nnoremap <leader><leader>l :exe 'GitLog '..expand('%')<cr>
nnoremap <leader><leader>L :exe 'GitLog! '..expand('%')<cr>
nnoremap <leader><leader><c-l> :GitLog<cr>
command! -nargs=? -bang GitLog call vimrc#Git#Log(<q-args>, <bang>0)

""" Git difftool
nnoremap <leader><leader>d :GitDiff<cr>
command! -complete=file -nargs=? GitDiff call vimrc#Git#Diff(<q-args>)
command! -nargs=0 DiffClose call vimrc#Git#DiffClose()
command! -nargs=+ GitDiffCmd call vimrc#Git#DiffCmd(<f-args>)
