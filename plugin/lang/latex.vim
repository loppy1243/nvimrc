func! s:LatexSetup()
 " Latex comment sequence
 let b:comment_seq = '%'
 let b:comment_esc = ''
  " Create begin/end block
 nnoremap <localleader><localleader> :vimrc#Latex#MakeBlockNormal<space>
 vnoremap <localleader><localleader> :<c-u>vimrc#Latex#MakeBlockVisual<space>
 inoremap <C-\> <esc>:vimrc#Latex#MakeBlockNormal<space>
 nnoremap <localleader>a :vimrc#Latex#MakeBlockInline<space>
endfunc

augroup latex
  au!
  au Filetype tex call s:LatexSetup()
augroup END
