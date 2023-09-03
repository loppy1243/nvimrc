if exists('b:did_ftplugin') || exists('s:executed')
  finish
endif
let s:executed = 1

let b:comment_seq = ';'

runtime ftplugin/lisp/slimv-lisp.vim

augroup LispVimrc
  au!
  au Filetype lisp if bufname() ==# 'REPL' | inoremap <s-cr> <cr> | endif
augroup END

let b:did_ftplugin = 1
