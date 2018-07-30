nnoremap <leader><leader><leader> :call vimrc#Git#Commit()<cr>
nnoremap <leader><leader>s :call vimrc#Git#Status()<cr>
nnoremap <leader><leader>g :!git<space>
nnoremap <leader><leader>a :!git add %<cr><cr>:echo 'Added file to index:' expand('%')<cr>
nnoremap <leader><leader>A :!git add -u<cr><cr>:echo 'Updated index'<cr>
nnoremap <leader><leader>p :split<cr>:new<cr>:call termopen("git push -u origin")<cr>
