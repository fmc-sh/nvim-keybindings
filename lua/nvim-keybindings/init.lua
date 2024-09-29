-- lua/hello-world/init.lua
local M = {}

function M.setup() end
-- Apply settings

--------------------------------------
-- FTerm
--------------------------------------
--
-- vim.api.nvim_set_keymap("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap(
-- 	"t",
-- 	"<A-i>",
-- 	'<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
-- 	{ noremap = true, silent = true }
-- )

-- Keybinding to toggle the same terminal session later
--vim.api.nvim_set_keymap("n", "<A-i>", "<CMD>lua toggle_my_term()<CR>", { noremap = true, silent = true })

--vim.api.nvim_set_keymap("t", "<A-i>", "<C-\\><C-n><CMD>lua toggle_my_term()<CR>", { noremap = true, silent = true })

-- Set keybinding to toggle the terminal
vim.api.nvim_set_keymap(
	"n",
	"<A-i>",
	"<CMD>lua require('nvim-fterm-init').toggle_my_term()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"t",
	"<A-i>",
	"<C-\\><C-n><CMD>lua require('nvim-fterm-init').toggle_my_term()<CR>",
	{ noremap = true, silent = true }
)

return M
