-- Leader key
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O")
