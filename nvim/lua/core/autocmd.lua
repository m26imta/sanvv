-- https://vimhelp.org/autocmd.txt.html#autocmd-events-abc
--

vim.cmd([[
augroup options_filetype
  autocmd!
  autocmd FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType c setlocal shiftwidth=8
  autocmd FileType cs setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
augroup END
]])

