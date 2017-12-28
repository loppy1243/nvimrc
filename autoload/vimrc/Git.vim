func! vimrc#Git#Status()
  new
  setlocal filetype=gitstatus
  0read !git status
endfunc

"func! s:CommitJobCtrl_old(job_id, data, event) dict
"  if a:event ==# 'stdout' || a:event ==# 'stderr'
"    let s:lines = extend(s:lines, a:data)
"  elseif a:event ==# 'exit'
"    let l:output = '`git commit` returned with exit status '.a:data.'. Output:'
"    for l:line in s:lines
"      let l:output .= "\<cr>".l:line
"    endfor
"    if !a:data
"      echom l:output
"    else
"      echoerr l:output
"    endif
"  else
"    echoerr 'Unexpected event received by job' a:job_id.':' a:event
"  endif
"endfunc

func! s:CommitJobCtrl(job_id, data, event) dict
  if a:event ==# 'stdout' || a:event ==# 'stderr'
    let s:lines = extend(s:lines, a:data)
  elseif a:event ==# 'exit'
    let s:lines = extend(['`git commit` returned with exit status '.a:data.'. Output:'], s:lines)
    split
    call append(0, s:lines)
  else
    echoerr 'Unexpected event received by job' a:job_id.':' a:event
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
