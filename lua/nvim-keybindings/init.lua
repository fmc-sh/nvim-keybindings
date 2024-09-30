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

--------------------------------------
-- Nvim term init (personal)
--------------------------------------

-- Set a keybinding to toggle the terminal with Alt + i
vim.api.nvim_set_keymap("n", "<A-i>", ":TTToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-i>", "<C-\\><C-n>:TTToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-i>", "<C-\\><C-n>:TTToggle<CR>", { noremap = true, silent = true })

-- Bind Alt + j to switch to normal mode in terminal
vim.api.nvim_set_keymap("t", "<A-j>", "<C-\\><C-n>", { noremap = true, silent = true })

--------------------------------------
-- Vim-obsession
--------------------------------------

-- Assuming you already have Telescope and vim-obsession installed

-- Define your session directory
local session_dir = vim.fn.expand("~/.vim-sessions")

-- Function to save the current session
function SaveObsessionSession()
	local session_name = vim.fn.substitute(vim.fn.getcwd(), "/", "_", "g") -- Replace slashes with underscores
	local session_path = session_dir .. "/" .. session_name .. ".vim"
	vim.cmd("Obsess " .. session_path)
	print("Session saved to " .. session_path)
end

-- Function to load a selected session from Telescope
function LoadObsessionSession(session)
	local session_path = session_dir .. "/" .. session
	vim.cmd("source " .. session_path)
	print("Session loaded from " .. session_path)
end

-- Key mapping to save the session
vim.api.nvim_set_keymap("n", "<leader>vs", ":lua SaveObsessionSession()<CR>", { noremap = true, silent = true })

-- Use Telescope to list sessions in the session directory and load the selected session
require("telescope").setup({})

local actions = require("telescope.actions")

function BrowseSessions()
	require("telescope.builtin").find_files({
		prompt_title = "< Browse Sessions >",
		cwd = session_dir,
		attach_mappings = function(prompt_bufnr, map)
			-- On selection, source the selected session
			map("i", "<CR>", function()
				local selection = require("telescope.actions.state").get_selected_entry()
				actions.close(prompt_bufnr)
				LoadObsessionSession(selection.value)
			end)
			return true
		end,
	})
end

-- Key mapping to browse and load sessions with Telescope
vim.api.nvim_set_keymap("n", "<leader>vb", ":lua BrowseSessions()<CR>", { noremap = true, silent = true })

return M
