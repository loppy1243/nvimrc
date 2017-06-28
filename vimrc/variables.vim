""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Variables.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Leaders
let mapleader = ','
let maplocalleader = '\'

"" Comment sequence default
if !exists('b:comment_seq')
  let b:comment_seq = ''
endif

"" Slimv/Paredit
let g:slimv_browser_cmd = 'firefox'
let g:slimv_leader = maplocalleader
let g:slimv_repl_simple_eval = 0
let g:slimv_repl_wrap = 0
let g:slimv_repl_split = 0
let g:slimv_lisp = '/usr/bin/sbcl'
let g:slimv_preferred = 'sbcl'
let g:slimv_repl_syntax = 1
let g:paredit_leader = maplocalleader
let g:paredit_shortmaps = 1

"" indentLine
let g:indentLine_faster = 1

"" Conque
let g:ConqueTerm_CloseOnEnd = 1

"" LaTeX
let g:tex_flavor='latex'
let g:tex_conceal=''
let g:tex_fold_enabled=0
let g:tex_nospell=1
let g:Tex_ViewRule_pdf='mupdf'
let g:Tex_DefaultTargetFormat='pdf'
