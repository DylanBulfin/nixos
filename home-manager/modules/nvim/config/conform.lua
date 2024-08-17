vim.g.is_autosave = false;

vim.keymap.set("n", "<leader>F",
	function()
		require("conform").format()
	end)

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt", lsp_format = "fallback" },
		nix = { "nixfmt" }
	},
	format_on_save = function()
		if (vim.g.is_autosave) then
			return
		else
			return { lsp_format = "fallback", timeout_ms = 500 }
		end
	end
})
