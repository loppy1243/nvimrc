func! vimrc#Git#Status()
  new
  setlocal filetype=git-status
  0read !git status
endfunc
