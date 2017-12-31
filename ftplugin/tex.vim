" Latex comment sequence
let b:comment_seq = '%'
let b:comment_esc = ''
 " Create begin/end block
nnoremap <buffer> <localleader><localleader> :vimrc#Latex#MakeBlockNormal<space>
vnoremap <buffer> <localleader><localleader> :<c-u>vimrc#Latex#MakeBlockVisual<space>
inoremap <buffer> <C-\> <esc>:vimrc#Latex#MakeBlockNormal<space>
nnoremap <buffer> <localleader>a :vimrc#Latex#MakeBlockInline<space>
