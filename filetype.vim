" Set julia filetype and fix paredit issue.
au BufNewFile,BufReadPost *.jl setfiletype julia \
                               | let g:paredit_mode = 0 \
                               | call PareditInitBuffer()
au BufNewFile,BufReadPost *.asd setfiletype lisp
au BufNewFile,BufReadPost *.asm setfiletype nasm
