vim.g.mapleader = " "

function Colemak()
  vim.keymap.set({ "n", "v" }, "m", "h", { desc = "Left" })
  vim.keymap.set({ "n", "v", "o" }, "n", "j", { desc = "Down" })
  vim.keymap.set({ "n", "v", "o" }, "e", "k", { desc = "Up" })
  vim.keymap.set({ "n", "v" }, "i", "l", { desc = "Right" })

  vim.keymap.set({ "n", "v", "o" }, "j", "e", { desc = "Next end of word" })
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

-- mini.nvim config
-- require("mini.ai").setup()
-- require("mini.surround").setup()