require("telescope").setup({
	pickers = {
		find_files = {
			theme = "dropdown",
		},
	},
	extensions = {
		smart_open = {
			match_algorithm = "fzf",
		},
	},
})
-- Base telescope picker keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "List buffers" })
vim.keymap.set("n", "<leader>ff", builtin.live_grep, { desc = "Live Grep" })

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("lsp_handlers")
require("telescope").load_extension("ui-select")
-- Plugin-specific keymaps
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "View workspace symbols" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "View document symbols" })
vim.keymap.set("n", "<leader>fr", builtin.grep_string, { desc = "View symbol references" })
vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "View quickfix list" })
vim.keymap.set("n", "<leader>fp", builtin.commands, { desc = "View commands" })
-- vim.keymap.set("n", "<leader><leader>", function()
-- 	require("telescope").extensions.smart_open.smart_open()
-- end, { noremap = true, silent = true })
