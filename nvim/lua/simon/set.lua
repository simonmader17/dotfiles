-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Cursor style
vim.opt.guicursor = ""

-- Line numbering
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.wrap = true
vim.opt.linebreak = true

-- Deactivate mouse interactivity
vim.opt.mouse = ""

vim.opt.cursorline = false

vim.opt.scrolloff = 8

vim.opt.updatetime = 500

vim.opt.colorcolumn = "80"

vim.g.tex_flavor = "latex"
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "tex",
	callback = function()
		vim.g.tex_flavor = "latex"
		vim.bo.filetype = "plaintex"
	end
})
