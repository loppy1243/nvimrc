" quickfix list
nnoremap <c-,>. <cmd>cnext<cr>
nnoremap <c-,>, <cmd>cprev<cr>
nnoremap <c-,><c-.> <cmd>cnext<cr>
nnoremap <c-,><c-,> <cmd>cprev<cr>

nnoremap <c-,>j <cmd>cbelow<cr>
nnoremap <c-,>k <cmd>cabove<cr>
nnoremap <c-,><c-j> <cmd>cbelow<cr>
nnoremap <c-,><c-k> <cmd>cabove<cr>

nnoremap <c-,>h <cmd>cpfile<cr>
nnoremap <c-,>l <cmd>cnfile<cr>
nnoremap <c-,><c-h> <cmd>cpfile<cr>
nnoremap <c-,><c-l> <cmd>cnfile<cr>

nnoremap <c-,>/ <cmd>cl +2<cr>
nnoremap <c-,><c-/> <cmd>cl +2<cr>

nnoremap g<c-,> <cmd>cc<cr>

" location list
nnoremap <c-s-,>, <cmd>lnext<cr>
nnoremap <c-s-,>. <cmd>lprev<cr>
nnoremap <c-s-,><c-,> <cmd>lnext<cr>
nnoremap <c-s-,><c-.> <cmd>lprev<cr>
nnoremap <c-s-,><c-s-,> <cmd>lnext<cr>
nnoremap <c-s-,><c-s-.> <cmd>lprev<cr>

nnoremap <c-s-,>j <cmd>lbelow<cr>
nnoremap <c-s-,>k <cmd>labove<cr>
nnoremap <c-s-,><c-j> <cmd>lbelow<cr>
nnoremap <c-s-,><c-k> <cmd>labove<cr>
nnoremap <c-s-,><c-s-j> <cmd>lbelow<cr>
nnoremap <c-s-,><c-s-k> <cmd>labove<cr>

nnoremap <c-s-,>h <cmd>lpfile<cr>
nnoremap <c-s-,>l <cmd>lnfile<cr>
nnoremap <c-s-,><c-h> <cmd>lpfile<cr>
nnoremap <c-s-,><c-l> <cmd>lnfile<cr>
nnoremap <c-s-,><c-s-h> <cmd>lpfile<cr>
nnoremap <c-s-,><c-s-l> <cmd>lnfile<cr>

nnoremap <c-s-,>/ <cmd>lli +2<cr>
nnoremap <c-s-,><c-/> <cmd>lli +2<cr>
nnoremap <c-s-,><c-s-/> <cmd>lli +2<cr>

nnoremap g<c-s-,> <cmd>ll<cr>
