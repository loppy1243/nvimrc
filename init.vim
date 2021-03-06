""" Disable plugins that override *my* mappings
""" FIXME: This still necessary?
nmap <Plug>DisableIMAP_JumpForward <Plug>IMAP_JumpForward

syntax on
filetype plugin on
filetype indent off
hi ColorColumn ctermbg=Red guibg=DarkRed
colorscheme vimrc_slate


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
set textwidth=80
let &colorcolumn = &textwidth + 1
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
"""" Plugins (vim-plug)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'JuliaEditorSupport/julia-vim'
Plug 'idris-hackers/idris-vim'
Plug 'Yggdroot/indentLine'
Plug 'lervag/vimtex'
call plug#end()


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

"" REPL buffers
let g:repl_bufnr = {}

"" indentLine
let g:indentLine_faster = 1

"" LaTeX
let g:tex_flavor = 'latex'
let g:tex_conceal = ''
let g:tex_fold_enabled = 0
let g:tex_nospell = 1
let g:Tex_ViewRule_pdf = 'mupdf'
let g:Tex_DefaultTargetFormat = 'pdf'

"" vimtex
let g:vimtex_syntax_conceal_default=0

"" Vimpyter
let g:vimpyter_jupyter_cmd = 'anaconda jupyter'

"" Agda
let g:agda_extraincpaths = ['/usr/share/agda-stdlib/']

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
  let $GIT_EDITOR = $VISUAL
endif
