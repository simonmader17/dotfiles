function ColorMyPencils()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { bg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeStatusLineNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
end

ColorMyPencils()
