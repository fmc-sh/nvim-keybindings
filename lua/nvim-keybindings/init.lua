-- lua/hello-world/init.lua
local M = {}

function M.setup() end
-- Apply settings

vim.api.nvim_set_keymap("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"t",
	"<A-i>",
	'<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
	{ noremap = true, silent = true }
)

return M
