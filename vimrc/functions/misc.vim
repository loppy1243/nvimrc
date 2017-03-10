let s:tmplet_cache = {}

"" Expand str as if it were expanded by map; as such, str should contain no
"" whitespace.
"" FIXME, DOES NOT WORK PROPERLY
func! MapExpand(str)
  let l:prev_mapping = maparg(a:str, 'n')
  exe 'nnoremap ' . a:str . ' ' . a:str
  let l:ret = maparg(a:str, 'n')

  if l:prev_mapping == ''
    exe 'nunmap ' . a:str
  else
    exe 'nnoremap ' . a:str . ' ' . l:prev_mapping
  endif

  return l:ret
endfunc

func! SingleQuote(str)
  return "'" . substitute(a:str, "'", "''", 'g') . "'"
endfunc

"" Temporary let. Only works for global, script, and option variables.
func! TmpLet(var, val)
  exe "let s:tmplet_cache['" . a:var . "'] = " . a:var
  exe 'let ' . a:var . ' = a:val'
endfunc

"" Restore Temporary Let
func! RestoreTmpLet(var)
  exe 'let ' . a:var . " = s:tmplet_cache['" . a:var . "']"
  exe "unlet s:tmplet_cache['" . a:var . "']"
endfunc

