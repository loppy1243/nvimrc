setlocal tabstop=4
let b:comment_seq = '#'
let b:comment_esc = ''
let b:term_cmd = 'python3'

let b:make_file_f = funcref('s:ImportMod')
func! s:ImportMod()
  call b:repl_eval_f(b:repl_bufnr, ['import '.expand('%:t:r')])
endfunc
