local group = vim.api.nvim_create_augroup("RustAutocmd", {})

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = "rust",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		vim.keymap.set("n", "<leader>ca", function()
			vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
		end, { silent = true, buffer = bufnr, desc = "Code action" })
		vim.keymap.set("n", "<leader>rd", function()
			vim.cmd.RustLsp("openDocs")
		end, { silent = true, buffer = bufnr, desc = "Open Docs.rs" })
	end,
})
