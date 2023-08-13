ret = {}

local function reg_match(n, f)
  f = f or function(x) return x end
  return function(_, snip) return f(snip.captures[n]) end
end

local function i_extend_indent(extra)
  return isn(nil, i(1), "$PARENT_INDENT"..extra)
end

for fname, varname in pairs({locate='loc', style='sty'}) do
  table.insert(ret,
    s({ trig=fname, dscr=fname.." scope" },
      fmta([[
             <>(<><> =>> {
               <>
             })
           ]],
           { t(fname), t(varname), i(2), i(1) })))
  table.insert(ret,
    s({ trig='^(%s*)'..fname..'%(', dscr=fname.." scope",
        regTrig=true, wordTrig=false, snippetType='autosnippet' },
      fmta([[
             <><>(<><> =>> {
               <><>
             <>})
           ]],
           { f(reg_match(1)), t(fname), t(varname), i(2),
             f(reg_match(1)), i(1), f(reg_match(1)) })))
  table.insert(ret,
    s({ trig='([^%s]%s+)'..fname..'%(', dscr=fname.." scope",
        regTrig=true, wordTrig=false, snippetType='autosnippet' },
      fmta([[
             <><>(<><> =>> {
               <>
             })
           ]],
           { f(reg_match(1)), t(fname), t(varname), i(2), i(1) })))
end

return ret
