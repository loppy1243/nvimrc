""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" All things option.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('s:executed')

let s:executed = 1

call Include(g:vimrc_dir . '/functions/statusline.vim')

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
set statusline+=\ %{IsModifiedStatus()}
" 'filetype'
set statusline+=%{FiletypeStatus()}
" (line_number, column_number)/number_of_lines
set statusline+=\ -\ (%04.4l,%03.3c,%05.5o)/%L
" Whether zoomed in on window with ZoomWin
set statusline+=%=[%{g:ZoomWin_status}]
endif

