au BufNewFile,BufReadPost *.asd      setfiletype lisp
au BufNewFile,BufReadPost *.asm      setfiletype nasm
au BufNewFile,BufReadPost *.cl,*.cu  setfiletype c
au BufNewFile,BufReadPost *.plt      setfiletype gnuplot
au BufNewFile,BufReadPost *.sb       setfiletype sh

" Fix paredit issue.
au BufNewFile,BufRead,BufReadPost *.jl setfiletype julia
