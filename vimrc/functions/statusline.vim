""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Functions used within the definition of the statusline.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Returns "[-]" if the function is not 'modifiable',
"" "---" if it has not been 'modified', and "[+]" if it has.
func! IsModifiedStatus()
  if !&modifiable
    return '[-]'
  elseif &modified
    return '[+]'
  else
    return '---'
  endif
endfunc

"" Returns "[&filetype]" if 'filetype' is set and
"" '---' otherwise.
func! FiletypeStatus()
  if &filetype !=# ''
    return '[' . &filetype . ']'
  else
    return '---'
  endif
endfunc

func! SetZoomWinStatus(state)
  if a:state
    let g:ZoomWin_status = 'Zoomed'
  else
    let g:ZoomWin_status = 'Normal'
  endif
endfunc
