"" Returns "[-]" if the function is not 'modifiable',
"" "---" if it has not been 'modified', and "[+]" if it has.
func! vimrc#status#IsModified()
  if !&modifiable
    return '[-]'
  elseif &modified
    return '[+]'
  else
    return '---'
  endif
endfunc

"" Returns "[&filetype]" if 'filetype' is set and
"" '---' otherwise.
func! vimrc#status#Filetype()
  if &filetype !=# ''
    return '['.&filetype.']'
  else
    return '---'
  endif
endfunc
 
function! vimrc#status#LuaSnip()
  hi User1 guibg=#a0a0f0 guifg=#000000
  hi User2 guibg=#404090
  let l:luaprog =<< trim END
    (function()
	  local snip = require("luasnip").get_active_snip()
	  if snip then
		return { snip.trigger, snip.dscr[1] }
      else
        return {}
      end
    end)()
  END
  let l:data = luaeval(join(l:luaprog, "\n"))
  if empty(l:data)
      return ''
  else
      let g:_statusline_luasnip_trig = l:data[0]
      let g:_statusline_luasnip_dscr = l:data[1]
      return '%1*%{g:_statusline_luasnip_trig}%* %2*%{g:_statusline_luasnip_dscr}%*'
  endif
endfunction
