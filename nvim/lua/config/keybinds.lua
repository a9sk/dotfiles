vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("n", "<C-x>o", "<C-w>w", { desc = "Switch window" })

vim.keymap.set("n", "<C-x>3", "<C-w>v", { desc = "Vertical split" })

vim.keymap.set("n", "<C-x>2", "<C-w>s", { desc = "Horizontal split" })

vim.keymap.set("n", "<C-x>1", "<C-w>o", { desc = "Delete other windows" })