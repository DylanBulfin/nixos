require("trouble").setup({ warn_no_results = false, auto_close = true })

vim.keymap.set(
	"n",
	"<leader>xx",
	"<Cmd>Trouble diagnostics open filter.buf=0<CR>",
	{ desc = "Toggle Trouble diagnostics panel" }
)
vim.keymap.set(
	"n",
	"<leader>xe",
	"<Cmd>Trouble diagnostics open filter.severity=1 filter.buf=0<CR>",
	{ desc = "Toggle Trouble error list" }
)

vim.keymap.set(
	"n",
	"<leader>xX",
	"<Cmd>Trouble diagnostics open<CR>",
	{ desc = "Toggle Trouble full diagnostics panel" }
)
vim.keymap.set(
	"n",
	"<leader>xE",
	"<Cmd>Trouble diagnostics open filter.severity=1<CR>",
	{ desc = "Toggle Trouble full error list" }
)

vim.keymap.set("n", "<leader>xc", "<Cmd>Trouble diagnostics close")
