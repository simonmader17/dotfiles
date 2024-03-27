require("simon.set")
require("simon.secrets") -- Includes secrets like vim.g.codestats_api_key
require("simon.vscode")
require("simon.remap")
if vim.g.vscode then
	require("simon.packer-vscode")
else
	require("simon.packer")
end
