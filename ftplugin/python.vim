setlocal tabstop=4
let b:comment_seq = '#'
let b:comment_esc = ''
let b:term_cmd = 'python3'

command -nargs=1 PythonReplHelp call b:repl_eval_f(b:repl_bufnr, ['help('.<q-args>.')'])
setlocal keywordprg=:PythonReplHelp

func! s:ImportMod()
  call b:repl_eval_f(b:repl_bufnr, ['import '.expand('%:t:r')])
endfunc
let b:make_file_f = funcref('s:ImportMod')
