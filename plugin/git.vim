nnoremap <leader><leader><leader> :call vimrc#Git#Commit()<cr>
nnoremap <leader><leader><s-,> :call vimrc#Git#AmendCommit()<cr>
nnoremap <leader><leader><c-,> :call vimrc#Git#AmendCommitNoEdit()<cr>
"nnoremap <leader><leader>s :call vimrc#Git#Status()<cr>
nnoremap <leader><leader>s :!git status -bs<cr>
nnoremap <leader><leader>a :!git add %<cr><cr>:echo 'Added file to index:' expand('%')<cr>
nnoremap <leader><leader>A :!git add -u<cr><cr>:echo 'Updated index'<cr>
nnoremap <leader><leader>p :new<cr>:call termopen("git push")<cr>
" Broken...?
"nnoremap <leader><leader>d :tabnew<cr>:!git difftool -t nvimdiff -y #<cr>
