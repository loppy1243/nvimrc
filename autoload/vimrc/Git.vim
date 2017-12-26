func! vimrc#Git#Status()
  new
  setlocal filetype=gitstatus
  0read !git status
endfunc

func! s:CommitJobCtrl(job_id, data, event) dict
  if a:event ==# 'stdout' || a:event ==# 'stderr'
    let s:lines = extend(s:lines, a:data)
  elseif a:event ==# 'exit'
    if !a:data
      echom '`git commit` returned with exit status' a:data . '. Output:'
      for l:line in s:lines
        echom l:line
      endfor
    else
      echoerr '`git commit` returned with exit status' a:data . '. Output:'
      for l:line in s:lines
        echoerr l:line
      endfor
  else
    echoerr 'Unexpected event received by job' a:job_id . ':' a:even
  endif
endfunc

func! vimrc#Git#Commit()
  let s:lines = []
  call jobstart(['git', 'commit'],
\               {'on_stdout': funcref('s:CommitJobCtrl'),
\                'on_stderr': funcref('s:CommitJobCtrl'),
\                'on_exit': funcref('s:CommitJobCtrl')})
endfunc
