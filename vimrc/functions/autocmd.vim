""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" These functions are used to implement mappings etc. that are dependent
""""" upon some autocmd.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call Include(g:vimrc_dir . '/variables.vim')

"" Mappings that somehow depend on a Filetype autocmd
func! FiletypeAUDependentMappings()
  """ Abbreviations
  exe 'iabbrev <buffer> ' . b:comment_seq . "--> " . repeat(b:comment_seq, 80)
endfunc

