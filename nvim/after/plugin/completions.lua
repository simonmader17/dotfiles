local cmp = require('cmp')
local ls = require('luasnip')

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
		{name = 'luasnip'}
	},
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if ls.expand_or_jumpable() then
				ls.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<down>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<up>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	snippet = {
		expand = function(args)
			ls.lsp_expand(args.body)
		end,
	},
	-- Preselect first item
	-- preselect = "item",
	-- completion = {
	-- 	completeopt = "menu,menuone,noinsert"
	-- }
})

-- my snippets
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.add_snippets("tex", {
	s("snip", {
		t("s(\""), i(1, "SNIPPET_NAME"), t({"\", {", ""}),
		t("\t"), i(2, "SNIPPET_CONTENT"),
		t({"", "}),"}), i(0)
	}),
	s("qq", {
		t("\\enquote{"), i(1, "TEXT"), t("}"), i(0)
	}),
	s("mysection", {
		t("\\"), i(1, "SECTION_TYPE"), t("*{"), i(2, "SECTION_NAME"), t({"}", ""}),
		t("\\addcontentsline{toc}{"), rep(1), t("}{"), rep(2), t({"}", ""}), i(0)
	}),
	s("bfm", {
		t("$\\boldsymbol{"), i(1, "BOLD_MATH"), t("}$"), i(0)
	}),
	s("bf", {
		t("\\textbf{"), i(1, "BOLD_TEXT"), t("}"), i(0)
	}),
	s("it", {
		t("\\textit{"), i(1, "ITALIC_TEXT"), t("}"), i(0)
	}),
	s("tt", {
		t("\\texttt{"), i(1, "TYPEWRITTEN_TEXT"), t("}"), i(0)
	}),
	s("sc", {
		t("\\textsc{"), i(1, "SMALLCAPS_TEXT"), t("}"), i(0)
	}),
	s("inc", {
		t("\\includegraphics[width="), i(1, "\\textwidth"), t("]{"), i(2, "FILENAME"), t("}"), i(0)
	}),
	s("\\begin", {
		t("\\begin{"), i(1, "ENV"), t({"}", "\t"}),
		i(0),
		t({"", "\\end{"}), rep(1), t("}")
	}),
	s("\\frac", {
		t("\\frac{"), i(1, "NUMERATOR"), t("}{"), i(2, "DENOMINATOR"), t("}"), i(0)
	}),
	s("\\binom", {
		t("\\binom{"), i(1, "n"), t("}{"), i(2, "k"), t("}"), i(0)
	}),
	s("fig", {
		t({"\\begin{figure}[H]", "\t\\centering", "\t\\includegraphics[width="}),
		i(1, "\\textwidth"), t("]{"), i(2, "FILENAME"), t({"}", "\t\\caption{"}),
		i(3, "CAPTION"), t({"}", "\t\\label{"}),
		i(4, "LABEL"), t({ "}", "\\end{figure}", "", "" }),
		i(0)
	}),
})

-- load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()
