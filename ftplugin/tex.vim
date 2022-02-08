if !exists('s:executed')
    call system("mkfifo '".g:llpp_socket."'")
endif
let s:executed = 1

" Latex comment sequence
let b:comment_seq = '%'
let b:comment_esc = ''

"function s:MakeLLPPSocket()
"    let b:llpp_socket = tempname()
"    let g:vimtex_view_general_viewer = "llpp -remote '" . b:llpp_socket . "'"
"    let $NVIM_LLPP_SOCKET = b:llpp_socket
"    exe! "!mkfifo '".b:llpp_socket."'"
"endfunction
"
"augroup MyTex
"    autocmd!
"    autocmd VimtexEventCompileStarted * call s:MakeLLPPSocket()
"    autocmd VimtexEventCompiledStopped * call delete(b:llpp_socket)
"augroup END
