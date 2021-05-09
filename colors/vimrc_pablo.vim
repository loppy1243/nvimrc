if exists('syntax_on')
  syntax reset
endif

runtime colors/pablo.vim
let g:colors_name = 'vimrc_pablo'

hi Constant   ctermfg=Red                              guifg=Red
hi Special    ctermfg=DarkGrey                         guifg=DarkGrey
hi NonText    ctermfg=12                 gui=bold      guifg=#6495ed
hi DiffAdd                     ctermbg=4                             guibg=#008b8b
hi DiffDelete ctermfg=12       ctermbg=6 gui=bold      guifg=#6495ed guibg=DarkCyan
hi SpellCap   ctermbg=12                 gui=undercurl                              guisp=#6495ed

