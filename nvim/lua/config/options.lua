vim.opt.number = true
vim.opt.cursorline = true
-- NOTE: relative number is nice if i want to move with Xk/Xj...
vim.opt.relativenumber = true

vim.opt.shiftwidth = 4

vim.o.clipboard = "unnamedplus"

vim.o.whichwrap = vim.o.whichwrap .. "<,>,[,]"

vim.opt.tabstop = 4        -- how many spaces a tab *looks like*
vim.opt.softtabstop = 0    -- optimize insert / delete of tabs

vim.o.foldmethod = "indent"
vim.o.foldlevel = 99  -- keep everything open by default

