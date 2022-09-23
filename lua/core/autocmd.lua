--Revert to where the cursor was when the file was last closed
vim.cmd([[autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif]])

vim.cmd([[set iskeyword+=-]])

vim.cmd("set whichwrap+=<,>,[,],h,l")

-- about fold
vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_trhttps://github.com/topics/nvim-cmpeesitter#foldexpr()")

-- set bg transparent
vim.cmd([[autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE]])

--
-- vim.cmd(
-- 	[[autocmd BufWritePre *.go :silent! lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })]]
-- )
-- vim.cmd([[autocmd BufWritePre *.go :silent! lua vim.lsp.buf.format()]])
