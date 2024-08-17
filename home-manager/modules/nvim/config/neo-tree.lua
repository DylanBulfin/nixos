vim.keymap.set("n", "<leader>vo", "<Cmd>Neotree<CR>", { silent = true, desc = "Open and focuse file tree" })
vim.keymap.set("n", "<leader>vc", "<Cmd>Neotree close<CR>", { silent = true, desc = "Close file tree" })

require("neo-tree").setup({
	window = {
    position = "right",
		mappings = {
			["e"] = "",
		},
	},
})
