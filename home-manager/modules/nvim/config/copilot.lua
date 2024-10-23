vim.api.nvim_create_augroup("Copilot", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	group = "Copilot",
	callback = function()
    if not vim.g.copilot_init then
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
      vim.g.copilot_init = true
      vim.cmd.Copilot("disable")
    end
	end,
})

vim.g.copilot_status = false

vim.keymap.set("n", "<leader>cs", "<Cmd>Copilot status<CR>", { desc = "Copilot status" })
vim.keymap.set("n", "<leader>ce", function()
	if not vim.g.copilot_init then
		return
	end
	vim.g.copilot_status = true
	vim.cmd.Copilot("enable")
end, { desc = "Copilot enable" })
vim.keymap.set("n", "<leader>cd", function()
	if not vim.g.copilot_init then
		return
	end
	vim.g.copilot_status = false
	vim.cmd.Copilot("disable")
end, { desc = "Copilot disable" })
