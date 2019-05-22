nnoremap <M-d> :CmdHere date +'%a %d %b %Y %R %Z'<cr>
nnoremap <M-D> :CmdHere date +'%R'<cr>
inoremap <M-d> <esc>:CmdInsertHere date +'%a %d %b %Y %R %Z'<cr>
inoremap <M-D> <esc>:CmdInsertHere date +'%R'<cr>

"" Change checkbox mappings
silent! nunmap <C-Space>
silent! vunmap <C-Space>
nmap <S-Space> <Plug>VimwikiToggleListItem
vmap <S-Space> <Plug>VimwikiToggleListItem
