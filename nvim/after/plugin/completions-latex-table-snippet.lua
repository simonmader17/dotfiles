-- Source: https://github.com/L3MON4D3/LuaSnip/wiki/Misc#dynamicnode-with-user-input

local ls = require("luasnip")
local util = require("luasnip.util.util")
local node_util = require("luasnip.nodes.util")

local function find_dynamic_node(node)
	-- the dynamicNode-key is set on snippets generated by a dynamicNode only (its'
	-- actual use is to refer to the dynamicNode that generated the snippet).
	while not node.dynamicNode do
		node = node.parent
	end
	return node.dynamicNode
end

local external_update_id = 0
-- func_indx to update the dynamicNode with different functions.
function dynamic_node_external_update(func_indx)
	-- most of this function is about restoring the cursor to the correct
	-- position+mode, the important part are the few lines from
	-- `dynamic_node.snip:store()`.


	-- find current node and the innermost dynamicNode it is inside.
	local current_node = ls.session.current_nodes[vim.api.nvim_get_current_buf()]
	local dynamic_node = find_dynamic_node(current_node)

	-- to identify current node in new snippet, if it is available.
	external_update_id = external_update_id + 1
	current_node.external_update_id = external_update_id

	-- store which mode we're in to restore later.
	local insert_pre_call = vim.fn.mode() == "i"
	-- is byte-indexed! Doesn't matter here, but important to be aware of.
	local cursor_pos_pre_relative = util.pos_sub(
	util.get_cursor_0ind(),
	current_node.mark:pos_begin_raw()
	)

	-- leave current generated snippet.
	node_util.leave_nodes_between(dynamic_node.snip, current_node)

	-- call update-function.
	local func = dynamic_node.user_args[func_indx]
	if func then
		-- the same snippet passed to the dynamicNode-function. Any output from func
		-- should be stored in it under some unused key.
		func(dynamic_node.parent.snippet)
	end

	-- last_args is used to store the last args that were used to generate the
	-- snippet. If this function is called, these will most probably not have
	-- changed, so they are set to nil, which will force an update.
	dynamic_node.last_args = nil
	dynamic_node:update()

	-- everything below here isn't strictly necessary, but it's pretty nice to have.


	-- try to find the node we marked earlier.
	local target_node = dynamic_node:find_node(function(test_node)
		return test_node.external_update_id == external_update_id
	end)

	if target_node then
		-- the node that the cursor was in when changeChoice was called exists
		-- in the active choice! Enter it and all nodes between it and this choiceNode,
		-- then set the cursor.
		node_util.enter_nodes_between(dynamic_node, target_node)

		if insert_pre_call then
			util.set_cursor_0ind(
			util.pos_add(
			target_node.mark:pos_begin_raw(),
			cursor_pos_pre_relative
			)
			)
		else
			node_util.select_node(target_node)
		end
		-- set the new current node correctly.
		ls.session.current_nodes[vim.api.nvim_get_current_buf()] = target_node
	else
		-- the marked node wasn't found, just jump into the new snippet noremally.
		ls.session.current_nodes[vim.api.nvim_get_current_buf()] = dynamic_node.snip:jump_into(1)
	end
end

-- Bind the function to some key:
vim.api.nvim_set_keymap('i', "<C-t>", '<cmd>lua _G.dynamic_node_external_update(1)<Cr>', {noremap = true})
vim.api.nvim_set_keymap('s', "<C-t>", '<cmd>lua _G.dynamic_node_external_update(1)<Cr>', {noremap = true})

vim.api.nvim_set_keymap('i', "<C-g>", '<cmd>lua _G.dynamic_node_external_update(2)<Cr>', {noremap = true})
vim.api.nvim_set_keymap('s', "<C-g>", '<cmd>lua _G.dynamic_node_external_update(2)<Cr>', {noremap = true})

-- Now it's time to make use of the new function
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local function column_count_from_string(descr)
	-- this won't work for all cases, but it's simple to improve
	-- (feel free to do so! :D )
	return #(descr:gsub("[^clm]", ""))
end

-- function for the dynamicNode.
local tab = function(args, snip)
	local cols = column_count_from_string(args[1][1])
	-- snip.rows will not be set by default, so handle that case.
	-- it's also the value set by the functions called from dynamic_node_external_update().
	if not snip.rows then
		snip.rows = 1
	end
	local nodes = {}
	-- keep track of which insert-index we're at.
	local ins_indx = 1
	for j = 1, snip.rows do
		-- use restoreNode to not lose content when updating.
		table.insert(nodes, r(ins_indx, tostring(j).."x1", i(1)))
		ins_indx = ins_indx+1
		for k = 2, cols do
			table.insert(nodes, t" & ")
			table.insert(nodes, r(ins_indx, tostring(j).."x"..tostring(k), i(1)))
			ins_indx = ins_indx+1
		end
		table.insert(nodes, t{"\\\\", ""})
	end
	-- fix last node.
	nodes[#nodes] = t""
	return sn(nil, nodes)
end

ls.add_snippets("tex", {
	s("tabular", fmt([[
	\begin{{tabular}}{{{}}}
	{}
	\end{{tabular}}
	]], {i(1, "c"), d(2, tab, {1}, {
		user_args = {
			-- Pass the functions used to manually update the dynamicNode as user args.
			-- The n-th of these functions will be called by dynamic_node_external_update(n).
			-- These functions are pretty simple, there's probably some cool stuff one could do
			-- with `ui.input`
			function(snip) snip.rows = snip.rows + 1 end,
			-- don't drop below one.
			function(snip) snip.rows = math.max(snip.rows - 1, 1) end
		}
	} )}))
})
