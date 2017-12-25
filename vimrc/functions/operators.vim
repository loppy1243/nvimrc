""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Functions that implement operators.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! DoubleQuoteOperator(type)
  if a:type ==# 'char'
    exe "normal! `[v`]\<esc>`<i\"\<esc>`>la\"\<esc>"
  elseif a:type ==# 'line'
    exe "normal! '[0V']$\<esc>`<i\"\<esc>`>a\"\<esc>"
  elseif a:type ==# 'v'
    exe "normal! `<v`>\<esc>`<i\"\<esc>`>la\"\<esc>"
  elseif a:type ==# 'V'
    " TODO
  elseif a:type ==# "\<c-v>"
    " TODO
  else
    echom 'The world has ended.'
  endif
endfunc

func! SingleQuoteOperator(type)
  if a:type ==# 'char'
    exe "normal! `[v`]\<esc>`<i'\<esc>`>la'\<esc>"
  elseif a:type ==# 'line'
    exe "normal! '[0V']$\<esc>`<i'\<esc>`>a'\<esc>"
  elseif a:type ==# 'v'
    exe "normal! `<i'\<esc>`>la'\<esc>"
  elseif a:type ==# 'V'
    " TODO
  elseif a:type ==# "\<c-v>"
    " TODO
  else
    echom 'The world has ended.'
  endif
endfunc
