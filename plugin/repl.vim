func! s:ReplEval(buf, lines)
  call vimrc#ReplEval(a:buf, a:lines)
endfunc

func! s:Make(file)
  make
endfunc

command! -nargs=1 SetRunExpr let b:run_expr = <q-args>
func! s:RunFile(file)
  call b:repl_eval_f(g:repl_bufnr[&l:filetype], [b:run_expr])
endfunc

augroup repl
  au!
  au BufEnter * if !exists('b:repl_eval_f') | let b:repl_eval_f = funcref('s:ReplEval') | endif
  au BufEnter * if !exists('b:make_file_f') | let b:make_file_f = funcref('s:Make') | endif
  au BufEnter * if !exists('b:run_file_f') | let b:run_file_f = funcref('s:RunFile') | endif
augroup END
