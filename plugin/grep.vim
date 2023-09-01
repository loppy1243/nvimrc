let g:vimgrep_default_pattern = '**'
command! -nargs=? SetVimgrepPattern call vimrc#SetVimgrepPattern(<f-args>)

nnoremap <expr> <leader>/
\ ':lvimgrep // ' . g:vimgrep_default_pattern . '<home>'
\ . repeat("<right>", strwidth("lvimgrep /"))
