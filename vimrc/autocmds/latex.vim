augroup latex
  au!
  " Latex comment sequence
  au Filetype tex let b:comment_seq='%'
  " Create begin/end block
  au Filetype tex command __LatexMakeBlockNormal -nargs=1 call LatexMakeBlock('n', <q-args>)
  au Filetype tex command __LatexMakeBlockVisual -nargs=1 call LatexMakeBlock(visualmode(), <q-args>)
  au Filetype tex nnoremap <localleader><localleader> :__LatexMakeBlockNormal<space>
  au Filetype tex vnoremap <localleader><localleader> :__LatexMakeBlockVisual<space>
augroup END
