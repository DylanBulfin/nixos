vim.api.nvim_create_augroup("Copilot", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	group = "Copilot",
	callback = function()
		require("copilot").setup({
			panel = {
				enabled = false,
			},
			suggestion = {
				auto_trigger = true,
				debouce = 100,
				keymap = {
					accept = "<C-f>",
					-- accept_word = "<C-w>",
					next = "<C-n>",
					prev = "<C-p>",
				},
			},
			server_opts_override = {
				settings = {
					advanced = {
						inlineSuggestCount = 3,
					},
				},
			},
		})
	end,
})

vim.keymap.set("n", "<leader>cs", "<Cmd>Copilot status<CR>", { desc = "Copilot status" })
vim.keymap.set("n", "<leader>ce", "<Cmd>Copilot enable<CR>", { desc = "Copilot enable" })
vim.keymap.set("n", "<leader>cd", "<Cmd>Copilot disable<CR>", { desc = "Copilot disable" })

