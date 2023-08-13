if exists('g:GuiLoaded')
  let g:guifont = 'Fira Code Medium'
  exe 'GuiFont!' g:guifont.':h11'
  GuiRenderLigatures 1

  " No toolbar
  set guioptions-=T
  " No scrollbar
  set guioptions-=r
  " No menu bar
  set guioptions-=m
  
  " indentLine
  let g:indentLine_char = '┊'
else
  hi Folded ctermbg=Blue ctermfg=Gray
  let g:indentLine_char = '|'
  let g:indentLine_color_tty_dark = 0
endif
