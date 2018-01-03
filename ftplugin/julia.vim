setlocal tabstop=4
let b:comment_seq = '#'
let b:comment_esc = ''
let b:term_cmd = 'julia'

func! s:ReplEval(buf, text)
  if len(a:text) == 1
    let l:cmd = extend(a:text, [''])
  else
    if getbufvar(a:buf, 'repl_scratch_file', 0) is 0
      call setbufvar(a:buf, 'repl_scratch_file', tempname())

      augroup _julia_repl_scratch_file
        au!
        au BufUnload <buffer=a:buf> call delete(b:repl_scratch_file)
                                \ | unlet b:repl_scratch_file
                                \ | au! _julia_repl_scratch_file
      augroup END
    endif

    let l:f = getbufvar(a:buf, 'repl_scratch_file')
    call writefile(a:text, l:f)

    let l:cmd = ['include("'.l:f.'")', '']
  endif

  let l:id = getbufvar(a:buf, 'terminal_job_id', -1)
  if l:id == -1
    echoerr 'No b:terminal_job_id associated with ['.a:buf.']' bufname(a:buf)
    return
  endif

  call jobsend(l:id, l:cmd)
endfunc

let b:repl_eval_f = funcref('s:ReplEval')
