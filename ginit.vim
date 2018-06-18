if exists('g:GuiLoaded')
"  " Make the colorscheme the same (mostly) as the shell
"  set background=dark
"  hi SpecialKey guifg=Blue
"  hi MoreMsg guifg=Green
"  hi Visual guifg=NONE guibg=Gray
"  hi Folded ctermbg=4 guibg=Blue
"  hi FoldColumn ctermbg=7
"  hi DiffAdd guibg=Blue
"  hi DiffChange guibg=Magenta
"  hi DiffDelete guibg=Cyan
"  hi Normal guifg=White guibg=Black
"  hi Cursor guibg=White
"  hi lCursor guibg=White
"  hi Comment guifg=Cyan
"  hi Constant guifg=Magenta
"  hi Special guifg=Red
"  hi Identifier guifg=Cyan
"  hi Statement guifg=Yellow
"  hi PreProc guifg=Blue
"  hi Type guifg=Green
"  hi Underlined guifg=Blue
"  hi Todo guifg=Black

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
