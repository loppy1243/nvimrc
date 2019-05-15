command! -nargs=? Memo call vimrc#OpenMemo(<f-args>)
command! -nargs=1 -bang CmdHere call vimrc#CmdHere(<q-bang>, <q-args>)

func! <SID>CmdInsertHere(cmd)
  call vimrc#CmdHere('!', a:cmd)
  if col('.') == col('$') - 1
    startinsert!
  else
    normal! l
    startinsert
  end
endfunc
command! -nargs=1 CmdInsertHere call <SID>CmdInsertHere(<q-args>)
inoremap <c-]> <esc>:CmdInsertHere<space>
