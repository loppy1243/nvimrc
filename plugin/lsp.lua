vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)

vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

local opts = { buffer = ev.buf }
vim.keymap.set('n', '<<?', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<<N', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<<n', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<<L', vim.diagnostic.setqflist, opts)
vim.keymap.set('n', '<<K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<<<m-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('i', '<c-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<<W', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<<C', vim.lsp.buf.rename, opts)
vim.keymap.set({ 'n', 'v' }, '<<A', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<<R', vim.lsp.buf.references, opts)

end})
