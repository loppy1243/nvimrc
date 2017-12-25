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

"" indentLine
let g:indentLine_faster = 1

"" LaTeX
let g:tex_flavor = 'latex'
let g:tex_conceal = ''
let g:tex_fold_enabled = 0
let g:tex_nospell = 1
let g:Tex_ViewRule_pdf = 'mupdf'
let g:Tex_DefaultTargetFormat = 'pdf'

"" ZoomWin
let g:ZoomWin_status = 'Normal'
let g:ZoomWin_funcref = function("SetZoomWinStatus")
