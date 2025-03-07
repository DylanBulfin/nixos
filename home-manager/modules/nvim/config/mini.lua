-- mini.nvim config
require("mini.ai").setup({
	mappings = {
		around = "a",
		inside = "i",

		around_next = "an",
		inside_next = "in",
		around_last = "al",
		inside_last = "il",
	},

	n_lines = 150,
})
require("mini.surround").setup({
	add = "sa",
	delete = "sd",
	find = "sf",
	find_left = "sF",
	highlight = "",
	replace = "sr",
	update_n_lines = "",

	suffix_last = "l",
	suffix_next = "n",
})
require("mini.move").setup({
	mappings = {
		-- Move current selection in Visual mode
		left = "<C-Left>",
		right = "<C-Right>",
		down = "<C-Down>",
		up = "<C-Up>",

		-- Move current line in Normal mode
		line_left = "<C-Left>",
		line_right = "<C-Right>",
		line_down = "<C-Down>",
		line_up = "<C-Up>",
	},
})

if not vim.g.vscode then
	require("mini.sessions").setup({
		directory = "",
		file = ".session",
		autoread = true,
		autowrite = true,
		hooks = {
			pre = {
				write = function()
					-- vim.cmd("<Cmd>Neotree close<CR>")
					if require("trouble").is_open("diagnostics") then
						vim.cmd("<Cmd>Trouble diagnostics close<CR>")
					end
					-- vim.cmd("<Cmd>mksession .session<CR>")
				end,
			},
		},
	})

	require("mini.notify").setup()
end
