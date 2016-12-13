augroup latex
  au!
  " Latex comment sequence
  au Filetype tex let b:comment_seq='%'
  " Create begin/end block
  au Filetype tex command! -nargs=1 LatexMakeBlockNormal call LatexMakeBlock('n', <f-args>)
  au Filetype tex command! -nargs=1 LatexMakeBlockVisual call LatexMakeBlock(visualmode(), <f-args>)
  au Filetype tex nnoremap <localleader><localleader> :LatexMakeBlockNormal<space>
  au Filetype tex vnoremap <localleader><localleader> :<c-u>LatexMakeBlockVisual<space>
augroup END
