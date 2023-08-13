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
set shell=elvish
set shellredir=>%s\ 2>&1
set shellpipe=2>&1\|\ tee
" Cannot figure out how to get elvish to work with shelltemp
set noshelltemp
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
set statusline+=\ %{vimrc#status#IsModified()}
" 'filetype'
set statusline+=%{vimrc#status#Filetype()}
" (line_number, column_number)/number_of_lines
set statusline+=\ -\ (%04.4l,%03.3c,%05.5o)/%L
" luasnip status
if $USER !=# "root"
    set statusline+=%=%{%vimrc#status#LuaSnip()%}
end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Plugins (vim-plug)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if $USER !=# "root"
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'JuliaEditorSupport/julia-vim'
Plug 'idris-hackers/idris-vim'
Plug 'Yggdroot/indentLine'
Plug 'lervag/vimtex'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*', 'do': 'make install_jsregexp'}
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'HiPhish/guile.vim'
Plug 'chlorm/vim-syntax-elvish'
Plug 'kaarmu/typst.vim'
Plug 'kovisoft/slimv'
call plug#end()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Variables.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $NVIM_LISTEN_ADDRESS = v:servername
let g:vimsyn_embed = 0

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
let g:indentLine_fileTypeExclude = ['markdown']
au FileType markdown setlocal conceallevel=0

"" LaTeX
"let g:tex_flavor = 'latex'
"let g:tex_conceal = ''
"let g:tex_fold_enabled = 0
"let g:tex_nospell = 1
"let g:Tex_ViewRule_pdf = 'mupdf'
let g:Tex_DefaultTargetFormat = 'pdf'

"" vimtex
let g:vimtex_view_general_viewer = 'llpp'
let g:vimtex_syntax_conceal_disable = 1
let g:vimtex_compiler_latexmk = {
   \'build_dir' : 'build',
   \'options' : [
   \    '-verbose',
   \    '-file-line-error',
   \    '-synctex=1',
   \    '-interaction=nonstopmode',
   \    '-halt-on-error'
   \]
\} 
let g:vimtex_quickfix_ignore_filters = [
   \'[dD]raft',
   \'Missing width',
   \'Missing height',
   \'Warning: Marginpar',
   \'Package caption Warning'
\]

"" Vimpyter
let g:vimpyter_jupyter_cmd = 'anaconda jupyter'

"" Agda
let g:agda_extraincpaths = ['/usr/share/agda-stdlib/']

"" UltiSnips
let g:UltiSnipsExpandTrigger = '<m-tab>'
let g:UltiSnipsJumpForwardTrigger = '<m-j>'
let g:UltiSnipsJumpBackwardTrigger = '<m-k>'
let g:UltiSnipsEditSplit = 'vertical'

"" LuaSnips
lua <<
require("luasnip").config.set_config({
    enable_autosnippets = true,
    store_selection_keys = "<c-tab>",
})
.
lua require("luasnip.loaders.from_lua").lazy_load({paths = vim.env.MYVIMRC .. "/luasnippets"})
imap <silent><expr> <c-tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-tab>'
smap <silent><expr> <c-tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<c-tab>'
imap <silent><expr> <c-s-tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<c-s-tab>'
smap <silent><expr> <c-s-tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<c-s-tab>'
imap <silent><expr> <c-space> luasnup#choice_active() ? '<Plug>luasnip-next-choice' : '<c-space>'
smap <silent><expr> <c-space> luasnup#choice_active() ? '<Plug>luasnip-next-choice' : '<c-space>'

"" Typst
let g:typst_cmd = "~/repos/typst/target/debug/typst"

"" Slimv
let g:slimv_leader = g:maplocalleader
let g:paredit_leader = g:maplocalleader

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
  let $GIT_EDITOR = $VISUAL
endif
