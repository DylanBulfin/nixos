vim.keymap.set("n", "<leader>F", function()
	require("conform").format()
end)

vim.g.autoformat = true

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt", lsp_format = "fallback" },
		nix = { "nixfmt" },
	},
})
