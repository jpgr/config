local nnoremap = function(from, to)
  vim.keymap.set('n', from, to, {})
end

nnoremap('<C-d>', '<C-d>zz')
nnoremap('<C-u>', '<C-u>zz')
nnoremap('n', 'nzz')
nnoremap('N', 'Nzz')
