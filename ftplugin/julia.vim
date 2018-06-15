setlocal tabstop=4
setlocal indentexpr=""
let b:comment_seq = '#'
let b:comment_esc = ''
let b:term_cmd = 'julia'

command -nargs=1 JuliaReplHelp call b:repl_eval_f(b:repl_bufnr, ['?'.<q-args>])
setlocal keywordprg=:JuliaReplHelp

func! s:IncludeFile()
  call b:repl_eval_f(b:repl_bufnr, ['include("'.expand('%').'")'])
endfunc
let b:make_file_f = funcref('s:IncludeFile')
