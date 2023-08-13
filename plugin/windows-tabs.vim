" Window management
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l
nnoremap <c-up> <c-w>k
nnoremap <c-down> <c-w>j

"" Split a window to the left, right, up, and down
nnoremap <leader>s <cmd>call vimrc#SplitWindowInDirection()<cr>

" Tab management
nnoremap <c-s-w>w <cmd>tabnext<cr>
nnoremap <c-s-w><c-s-w> <cmd>tabnext<cr>
nnoremap <c-s-w>W <cmd>tabprev<cr>
nnoremap <c-s-left> <cmd>tabN<cr>
nnoremap <c-s-right> <cmd>tabn<cr>

" Non-clobbering :only mapping
nnoremap <c-w>o <cmd>tab split<cr>
