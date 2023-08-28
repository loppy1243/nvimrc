au BufNewFile,BufReadPost *.asd          setfiletype lisp
au BufNewFile,BufReadPost *.asm          setfiletype nasm
au BufNewFile,BufReadPost *.cl,*.cu      setfiletype c
au BufNewFile,BufReadPost *.glsl         setfiletype c
au BufNewFile,BufReadPost *.plt          setfiletype gnuplot
au BufNewFile,BufReadPost *.sb           setfiletype sh
au BufNewFile,BufReadPost *.cls          setfiletype tex
au BufNewFile,BufReadPost *.xsh,.xonshrc setfiletype python

" Fix paredit issue.
au BufNewFile,BufRead,BufReadPost *.jl setfiletype julia
