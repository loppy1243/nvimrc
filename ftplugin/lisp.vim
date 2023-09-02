if exists('b:did_ftplugin') || exists('s:executed')
  finish
endif
let s:executed = 1

let b:comment_seq = ';'

runtime ftplugin/lisp/slimv-lisp.vim

let b:did_ftplugin = 1
