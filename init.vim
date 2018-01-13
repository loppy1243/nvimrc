""" Disable plugins that override *my* mappings
""" FIXME: This still necessary?
nmap <Plug>DisableIMAP_JumpForward <Plug>IMAP_JumpForward

syntax on
filetype plugin on
hi ColorColumn ctermbg=Red guibg=DarkRed
colorscheme vimrc


if exists('s:executed')
  finish
endif
let s:executed = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" All things option.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number
set numberwidth=4
set tabstop=2
set shiftwidth=0
set expandtab
set nowrap
" Have screen always centered on cursor
set scrolloff=999
set colorcolumn=95
set textwidth=0
set laststatus=2
" set foldmethod=marker
set nofoldenable
set foldlevelstart=0
set hlsearch
set incsearch
set autoindent
" *I* like them.
set errorbells
set formatoptions-=tro
set textwidth=94
set modeline
set grepprg=grep\ -nH\ $*

" Buffer number and file name
set statusline=[%n]\ %.20F
" Whether or not the buffer's been modified
set statusline+=\ %{vimrc#IsModifiedStatus()}
" 'filetype'
set statusline+=%{vimrc#FiletypeStatus()}
" (line_number, column_number)/number_of_lines
set statusline+=\ -\ (%04.4l,%03.3c,%05.5o)/%L


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Variables.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Leaders
let g:mapleader = ','
let g:maplocalleader = '\'

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

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif
