require("which-key").setup({
	icons = {
		mappings = false,
	},
})

vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer-local bindings" })
