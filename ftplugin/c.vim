setlocal tabstop=4

let b:comment_seq = '//'

if expand('%:e') == 'glsl'
  lua vim.diagnostic.disable(0)
endif
