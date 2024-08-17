require("hop").setup({
    keys = "arsgmeiqwfpbluy;zxcdvkhtn"
})
vim.keymap.set({ "n", "x", "o" }, "sn", "<Cmd>HopWord<CR>")
vim.keymap.set({ "n", "x", "o" }, "sc", "<Cmd>HopChar2<CR>")
vim.keymap.set({ "n", "x", "o" }, "st", "<Cmd>HopChar1<CR>")

-- Basic navigation remapping
vim.keymap.set({ "n", "v" }, "gi", "$")
vim.keymap.set({ "n", "v" }, "gm", "^")
