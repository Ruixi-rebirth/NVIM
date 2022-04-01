--Revert to where the cursor was when the file was last closed
vim.cmd([[autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif]])

vim.cmd([[set iskeyword+=-]])

vim.cmd("set whichwrap+=<,>,[,],h,l")
