vim.g.mapleader = " "

function Colemak()
	vim.keymap.set({ "n", "v" }, "m", "h", { desc = "Left" })
	vim.keymap.set({ "n", "v", "o" }, "n", "j", { desc = "Down" })
	vim.keymap.set({ "n", "v", "o" }, "e", "k", { desc = "Up" })
	vim.keymap.set({ "n", "v" }, "i", "l", { desc = "Right" })

	-- vim.keymap.set({ "n", "v", "o" }, "j", "e", { desc = "Next end of word" })
	vim.keymap.set({ "n", "v" }, "k", "n", { desc = "Next match" })
	vim.keymap.set({ "n", "v" }, "K", "N", { desc = "Previous match" })
	vim.keymap.set({ "n", "v" }, "u", "i", { desc = "Insert mode" })
	vim.keymap.set({ "n", "v" }, "U", "I", { desc = "Insert mode at beginning of line" })
	vim.keymap.set({ "n", "v" }, "l", "u", { desc = "Undo" })
	vim.keymap.set({ "n", "v" }, "L", "<C-r>", { desc = "Redo" })
end

function Qwerty()
	vim.keymap.set({ "n", "v" }, "h", "h", { desc = "Left" })
	vim.keymap.set({ "n", "v", "o" }, "j", "j", { desc = "Down" })
	vim.keymap.set({ "n", "v", "o" }, "k", "k", { desc = "Up" })
	vim.keymap.set({ "n", "v" }, "l", "l", { desc = "Right" })

	vim.keymap.set({ "n", "v", "o" }, "e", "e", { desc = "Next end of word" })
	vim.keymap.set({ "n", "v" }, "n", "n", { desc = "Next match" })
	vim.keymap.set({ "n", "v" }, "N", "N", { desc = "Previous match" })
	vim.keymap.set({ "n", "v" }, "i", "i", { desc = "Insert mode" })
	vim.keymap.set({ "n", "v" }, "I", "I", { desc = "Insert mode at beginning of line" })
	vim.keymap.set({ "n", "v" }, "u", "u", { desc = "Undo" })
	vim.keymap.set({ "n", "v" }, "U", "<C-r>", { desc = "Redo" })
end

vim.api.nvim_create_user_command("Colemak", function()
	Colemak()
end, {
	desc = "Set keybindings to Colemak",
})

vim.api.nvim_create_user_command("Qwerty", function()
	Qwerty()
end, {
	desc = "Set keybindings to Qwerty",
})

-- Basic navigation remapping
vim.keymap.set({ "n", "v" }, "gi", "$")
vim.keymap.set({ "n", "v" }, "gm", "^")

if not vim.g.vscode then
	-- Neovim-specific options
	vim.o.number = true
	vim.o.relativenumber = true
	vim.o.expandtab = true
	vim.o.cursorline = true
	vim.o.confirm = true
	vim.o.tabstop = 2
	vim.o.shiftwidth = 2
	vim.o.smartcase = true
	vim.o.ignorecase = true
	vim.o.smartindent = true
	vim.o.wrap = true
  vim.o.textwidth = 90 -- Width works better for my terminal
	vim.o.signcolumn = "no"
	vim.o.showmode = false
	vim.o.background = "dark"
	vim.o.listchars = "space:⋅,tab:▎_,trail:•,extends:❯,precedes:❮,nbsp:"
	vim.o.colorcolumn = "90"

	-- Neovim-specific binding
	vim.keymap.set("n", "<leader>qq", "<Cmd>qa<CR>", { desc = "Exit Neovim" })
	vim.keymap.set("n", "<leader>qQ", "<Cmd>qa!<CR>", { desc = "Exit Neovim with a bang" })

	vim.keymap.set("n", "<leader>bs", function()
		vim.cmd.write()
	end, { desc = "Save buffer" })

	vim.keymap.set({ "i", "c" }, "<C-BS>", "<C-w>", { desc = "Delete word back" })

	vim.keymap.set("n", "<C-w>a", "<C-w>t<C-w>o", { desc = "Close all but top left window" })
	vim.keymap.set("n", "<C-w>m", "<C-w>h", { desc = "Move to left window" })
	vim.keymap.set("n", "<C-w>i", "<C-w>l", { desc = "Move to right window" })
	vim.keymap.set("n", "<C-w>n", "<C-w>j", { desc = "Move to lower window" })
	vim.keymap.set("n", "<C-w>e", "<C-w>k", { desc = "Move to upper window" })

	vim.keymap.set("n", "<leader>w", "<C-w>", { remap = true })
	vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
	vim.keymap.set({ "n", "v" }, "<leader>P", '"+P')
	vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')

	vim.keymap.set("n", "<leader>a", "gg^vG$", { desc = "Select entire buffer" })

	vim.keymap.set({ "i", "n", "v" }, "<C-i>", function()
		vim.cmd.normal("zz")
	end, { desc = "Center current line" })

	-- Automatically moves help window to lower left, allowing me to use the <C-w>a binding safely
	local group = vim.api.nvim_create_augroup("WinMgmt", {})
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "help",
		callback = function()
			vim.cmd.wincmd("L")
		end,
	})

	function Sesh()
		vim.cmd.mksession(".session")
	end

	vim.api.nvim_create_user_command("Sesh", function()
		Sesh()
	end, {
		desc = "Create session",
	})
end

Colemak()
