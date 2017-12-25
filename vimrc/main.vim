""" Disable plugins that override *my* mappings
""" FIXME: This still necessary?
nmap <Plug>DisableIMAP_JumpForward <Plug>IMAP_JumpForward

if has('nvim')
  let g:vimrc_dir = '~/.config/nvim/vimrc'
else
  let g:vimrc_dir = '~/.vim/vimrc'
endif
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

""" Outsourcing
" Options (Sets)
call Include(g:vimrc_dir . '/options.vim')
" Variables (Lets)
call Include(g:vimrc_dir . '/variables.vim')
" Mappings
call Include(g:vimrc_dir . '/mappings/main.vim')

unlet g:include_dict

" source /usr/share/vim/vim80/ftplugin/man.vim

" Fix for racket K
" au Filetype racket :silent! nunmap <buffer> K

""" Uncategorized
syntax on
filetype on
filetype indent off
hi ColorColumn ctermbg=Red guibg=DarkRed

" Things keep getting highlighted...
nohlsearch
