require("neotest").setup({
	adapters = {
		-- require("rustaceanvim.neotest"),
	},
})

vim.keymap.set("n", "<leader>tt", function()
	require("neotest").run.run()
end, { desc = "Run tests" })

vim.keymap.set("n", "<leader>tp", function()
	require("neotest").output_panel.toggle()
end, { desc = "Toggle test output panel" })
