setlocal tabstop=4
let b:comment_seq = '#'
let b:comment_esc = ''
let b:term_cmd = 'julia'

let b:repl_eval_f = funcref('s:ReplEval')
func! s:ReplEval(buf, text)
  let l:cmd = extend(a:text, [''])

  let l:id = getbufvar(a:buf, 'terminal_job_id', -1)
  if l:id == -1
    echoerr 'no b:terminal_job_id associated with ['.a:buf.']' bufname(a:buf)
    return
  endif

  call jobsend(l:id, l:cmd)
endfunc

let b:make_file_f = funcref('s:IncludeFile')
func! s:IncludeFile()
  call s:ReplEval(b:repl_bufnr, ['include("'.expand('%').'")'])
endfunc

command! -nargs=1 JuliaSetRunExpr let b:julia_run_expr = <q-args>
let b:run_file_f = funcref('s:ExecFile')
func! s:ExecFile()
  call s:ReplEval(b:repl_bufnr, [b:julia_run_expr])
endfunc
