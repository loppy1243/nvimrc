augroup latex
  au!
  " Latex comment sequence
  au Filetype tex let b:comment_seq = '%'
  au Filetype tex let b:comment_esc = ''
  " Create begin/end block
  au Filetype tex command! -nargs=1 LatexMakeBlockNormal call LatexMakeBlock('n', <f-args>)
  au Filetype tex command! -nargs=1 LatexMakeBlockVisual call LatexMakeBlock(visualmode(), <f-args>)
  au Filetype tex command! -nargs=1 LatexMakeBlockInline call LatexMakeBlock('l', <f-args>)
  au Filetype tex nnoremap <localleader><localleader> :LatexMakeBlockNormal<space>
  au Filetype tex vnoremap <localleader><localleader> :<c-u>LatexMakeBlockVisual<space>
  au Filetype tex inoremap <C-\> <esc>:LatexMakeBlockNormal<space>
  au Filetype tex nnoremap <localleader>a :LatexMakeBlockInline<space>
augroup END
