local function reg_match(n)
  return function(_, snip) return snip.captures[n] end
end

return {
  s({trig="func", regTrig=true, wordTrig=false, snippetType="autosnippet"},
    fmt([[
          {}function! {}({})
            {}{}
          {}endfunction
        ]],
        { f(reg_match(1)), i(1), i(2), f(reg_match(1)), i(0), f(reg_match(1)) }))
}
