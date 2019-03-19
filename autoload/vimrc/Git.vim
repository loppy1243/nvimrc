func! vimrc#Git#Status()
  new
  setlocal filetype=gitstatus
  0read !git status
endfunc

func! s:CommitJobCtrl(job_id, data, event) dict
  if a:event ==# 'stdout' || a:event ==# 'stderr'
    let s:lines = extend(s:lines, a:data)
  elseif a:event ==# 'exit'
    let l:output = '`git commit` returned with exit status '.a:data
    echom l:output
    let l:output .= '. Output:'
    for l:line in s:lines
      let l:output .= "\n".l:line
    endfor
    if !a:data
      echo l:output
    else
      echohl ErrorMsg
      echo l:output
      echohl None
    endif
  else
    echohl ErrorMsg
    echom 'Unexpected event received by job' a:job_id.':' a:event
    echohl None
  endif
endfunc

func! vimrc#Git#Commit()
  let s:lines = []
  " Sets g:gitcommit_window
  call jobstart(['git', 'commit'],
\               {'on_stdout': funcref('s:CommitJobCtrl'),
\                'on_stderr': funcref('s:CommitJobCtrl'),
\                'on_exit': funcref('s:CommitJobCtrl')})
endfunc

func! vimrc#Git#AmendCommit()
  let s:lines = []
  " Sets g:gitcommit_window
  call jobstart(['git', 'commit', '--amend'],
\               {'on_stdout': funcref('s:CommitJobCtrl'),
\                'on_stderr': funcref('s:CommitJobCtrl'),
\                'on_exit': funcref('s:CommitJobCtrl')})
endfunc

func! vimrc#Git#AmendCommitNoEdit()
  !git commit --amend --no-edit
endfunc
