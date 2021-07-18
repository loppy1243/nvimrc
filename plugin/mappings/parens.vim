function <SID>deleteBraces()
    exe "normal! a\<space>\<esc>mA[(mB%x`Bx`A"
    if line("'A") ==# line("'B")
        normal! Xh
    else
        normal! xh
    endif
endfunction
nnoremap d% :call <SID>deleteBraces()<cr>

function <SID>visualBraces(l, r)
    let l:earlier = line('.') <= line("'>") && col('.') < col("'>")

    exe 'normal! `<i'.a:l."\<esc>`>"
    if line("'<") ==# line('.')
        normal! l
    endif
    if l:earlier
        exe 'normal! a'.a:r."\<esc>`<l"
    else
        exe 'normal! a'.a:r."\<esc>h"
    endif
endfunction
vnoremap ( <esc>:call <SID>visualBraces('(', ')')<cr>
vnoremap [ <esc>:call <SID>visualBraces('[', ']')<cr>
vnoremap { <esc>:call <SID>visualBraces('{', '}')<cr>

inoremap <m-(> <space><esc>mA[(%a)<esc>`Axi(
inoremap <m-[> <space><esc>mA[(%a]<esc>`Axi[
inoremap <m-{> <space><esc>mA[(%a}<esc>`Axi{

inoremap <m-)> <esc>lmA[(a(<esc>`Ali)
inoremap <m-]> <esc>lmA[(a[<esc>`Ali]
inoremap <m-}> <esc>lmA[(a{<esc>`Ali}
