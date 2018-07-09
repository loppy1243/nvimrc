command! -nargs=? Memo call vimrc#OpenMemo(<f-args>)
command! BufClose bprev <bar> split <bar> bnext <bar> bdel
