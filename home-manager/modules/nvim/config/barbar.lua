vim.g.barbar_auto_setup = false

require("barbar").setup({
    hide = { extensions = false },
    letters = "arstneiocdhxzgmvkbjplfuwyq;ARSTNEIOCDHXZGMVKBJPLFUWYQ"
})

-- Move to previous/next
vim.keymap.set("n", "<leader>N", "<Cmd>BufferPrevious<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>n", "<Cmd>BufferNext<CR>", { desc = "Next Buffer" })
-- Goto buffer in position...
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { desc = "Goto Buffer 1" })
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { desc = "Goto Buffer 2" })
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { desc = "Goto Buffer 3" })
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { desc = "Goto Buffer 4" })
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { desc = "Goto Buffer 5" })
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { desc = "Goto Buffer 6" })
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { desc = "Goto Buffer 7" })
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { desc = "Goto Buffer 8" })
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { desc = "Goto Buffer 9" })
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", { desc = "Goto Last Buffer" })
-- Pin/unpin buffer
vim.keymap.set("n", "<leader>bP", "<Cmd>BufferPin<CR>", { desc = "Pin Buffer" })
-- Pick Buffer
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferPick<CR>", { desc = "Buffer Pick Mode" })
-- Buffer Management
vim.keymap.set("n", "<leader>bc", "<Cmd>BufferClose<CR>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>ba", "<Cmd>BufferCloseAllButPinned<CR>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>bo", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", { desc = "Close Buffer" })
