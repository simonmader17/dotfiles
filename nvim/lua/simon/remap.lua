-- Leader key
vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- nvim-tree
vim.keymap.set("n", "<leader>pv", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O")

-- LaTeX mappings
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = "tex",
	callback = function()
		-- LaTeX save and compile
		vim.keymap.set("n", "<F4>", ":w<CR>:!lualatex --shell-escape %<CR><CR>")
		vim.keymap.set("i", "<F4>", "<ESC>:w<CR>:!lualatex --shell-escape %<CR><CR>a")
		vim.keymap.set("n", "<F5>", ":w<CR>:!pdflatex --shell-escape %<CR><CR>")
		vim.keymap.set("i", "<F5>", "<ESC>:w<CR>:!pdflatex --shell-escape %<CR><CR>a")
		-- LaTeX save and compile with biber
		vim.keymap.set("n", "<F17>", function()
			local withoutFileExt = vim.fn.expand("%"):gsub(".tex", "")
			return ":w<CR>:!pdflatex --shell-escape %<CR><CR>:!biber " .. withoutFileExt .. "<CR><CR>:!pdflatex --shell-escape %<CR><CR>"
		end, { expr = true })
		vim.keymap.set("i", "<F17>", function()
			local withoutFileExt = vim.fn.expand("%"):gsub(".tex", "")
			return "<ESC>:w<CR>:!pdflatex --shell-escape %<CR><CR>:!biber " .. withoutFileExt .. "<CR><CR>:!pdflatex --shell-escape %<CR><CR>a"
		end, { expr = true })
		-- LaTeX open pdf
		vim.keymap.set("n", "<F6>", function()
			local pdfName = vim.fn.expand("%"):gsub("tex", "pdf")
			return ":!xdg-open \"" .. pdfName .. "\" &<CR><CR>"
		end, { expr = true })
		vim.keymap.set("i", "<F6>", function()
			local pdfName = vim.fn.expand("%"):gsub("tex", "pdf")
			return "<ESC>:!xdg-open \"" .. pdfName .. "\" &<CR><CR>a"
		end, { expr = true })
	end
})

-- c mappings
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = "c",
	callback = function()
		-- format file
		vim.keymap.set("n", "<leader>f", ":w<CR>:!clang-format -i %<CR><CR>")
	end
})

-- java mappings
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = "java",
	callback = function()
		-- format file
		vim.keymap.set("n", "<leader>f", ":w<CR>:!clang-format -i %<CR><CR>")
	end
})