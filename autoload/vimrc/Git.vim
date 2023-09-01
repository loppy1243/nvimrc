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

function! vimrc#Git#Diff(file)
    if &l:diff
      echoerr "Buffer already diff'd"
      return
    endif

    if a:file ==# ''
        silent !git difftool -t nvim -- % &
    else
        exe "silent !git difftool -t nvim -- '"..a:file.."' &"
    endif
endfunction

function! s:DiffClose()
  if !(exists('s:diff_merged_winid') && exists('s:diff_tabpagenr'))
    return
  endif

  call win_gotoid(s:diff_merged_winid)
  diffoff
  if s:diff_tabpagenr == tabpagenr()
    tabclose
  endif

  unlet s:diff_merged_winid
  unlet s:diff_tabpagenr
endfunction

function! vimrc#Git#DiffCmd(...)
    call assert_true(a:0 !=# 3, "expected three file names")
    let l:local = a:1
    let l:remote = a:2
    let l:merged = a:3

    exe 'tabedit '..l:merged
    let s:diff_merged_winid = win_getid()
    let s:diff_tabpagenr = tabpagenr()
    diffthis
    au WinClosed <buffer> call s:DiffClose()

    if l:remote !=# l:merged
      setlocal statusline+=%=WORKTREE

      exe 'diffsplit '..l:remote
      setlocal ro
      setlocal bufhidden=delete
      setlocal statusline+=%=%#DiffAdd#DIFF\ POST%#StatusLine#
      au WinClosed <buffer> call s:DiffClose()
    
      exe 'vert diffsplit '..l:local
    else
      setlocal statusline+=%=%#DiffAdd#WORKTREE%#StatusLine#

      exe 'rightbelow vert diffsplit '..l:local
    endif
    setlocal ro
    setlocal bufhidden=delete
    setlocal statusline+=%=%#DiffDelete#DIFF\ PRE%#StatusLine#
    au WinClosed <buffer> call s:DiffClose()

    call win_gotoid(s:diff_merged_winid)
endfunction

function! vimrc#Git#Log(file, bang)
    if a:bang
        tabnew
    else
        new
    endif

    silent! 0file
    file Git Log
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal bufhidden=wipe

    AnsiEsc
    if a:file ==# ''
        read !git lg --color
    else
        exe "read !git lg --color '".a:file."'"
    endif
    normal! ggdd

    setlocal nomodified
    setlocal nomodifiable
endfunction
