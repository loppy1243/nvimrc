inoremap <plug>vimrc-pum-next <c-n>
inoremap <plug>vimrc-pum-prev <c-p>
inoremap <plug>vimrc-omnicomplete <c-x><c-o>

imap <silent><expr> <c-n> luasnip#expand_or_jumpable() ? '<plug>luasnip-expand-or-jump' : pumvisible() ? '<plug>vimrc-pum-next' : '<plug>vimrc-omnicomplete'
smap <silent><expr> <c-n> luasnip#jumpable(1) ? '<plug>luasnip-jump-next' : '<c-n>'

imap <silent><expr> <c-s-n> luasnip#jumpable(-1) ? '<plug>luasnip-jump-prev' : '<plug>vimrc-pum-prev'
smap <silent><expr> <c-s-n> luasnip#jumpable(-1) ? '<plug>luasnip-jump-prev' : '<plug>vimrc-pum-prev'

imap <silent><expr> <c-space> luasnip#choice_active() ? '<plug>luasnip-next-choice' : '<c-space>'
smap <silent><expr> <c-space> luasnip#choice_active() ? '<plug>luasnip-next-choice' : '<c-space>'

inoremap <silent><expr> <enter> pumvisible() ? '<c-y><cmd>pclose<cr>' : '<enter>'
