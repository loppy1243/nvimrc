""" Disable plugins that override *my* mappings
""" FIXME: This still necessary?
nmap <Plug>DisableIMAP_JumpForward <Plug>IMAP_JumpForward

let g:vimrc_dir = '~/.vim/vimrc'
let g:include_dict = {}

func! Source(file)
  exe 'source ' . a:file
endfunc

func! Include(file)
  if !(exists('g:include_dict[a:file]') && g:include_dict[a:file])
    let g:include_dict[a:file] = 1
    call Source(a:file)
  endif
endfunc

""" GUI-specific things
if has('gui_running')
  call Include(g:vimrc_dir . '/gui.vim')
else
  hi Folded ctermbg=Blue ctermfg=Gray
  let g:indentLine_char = '|'
  let g:indentLine_color_tty_dark = 0
endif

""" Outsourcing
" Options (Sets)
call Include(g:vimrc_dir . '/options.vim')
" Variables (Lets)
call Include(g:vimrc_dir . '/variables.vim')
" Mappings
call Include(g:vimrc_dir . '/mappings/main.vim')
" Autocmds
call Include(g:vimrc_dir . '/autocmds/main.vim')

unlet g:include_dict

source /usr/share/vim/vim80/ftplugin/man.vim

" Fix for abbreviations in lisp with SLIMV
au BufEnter,Filetype lisp,scheme,racket :silent! iunmap <buffer> <space>
" Fix for racket K
au Filetype racket :silent! nunmap <buffer> K

""" Uncategorized
syntax on
filetype on
filetype indent off
hi ColorColumn ctermbg=Red guibg=DarkRed

" Things keep getting highlighted...
nohlsearch
