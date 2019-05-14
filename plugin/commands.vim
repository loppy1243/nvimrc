command! -nargs=? Memo call vimrc#OpenMemo(<f-args>)
command! -nargs=1 -bang CmdHere call vimrc#CmdHere(<q-bang>, <q-args>)
