let g:vimgrep_default_pattern = '**'
command! -nargs=? SetVimgrepPattern call vimrc#SetVimgrepPattern(<f-args>)

nnoremap <expr> <leader>/ ':vimgrep // ' . g:vimgrep_default_pattern . '<home>' . repeat("<right>", strwidth("vimgrep /"))

