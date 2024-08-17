vim.api.nvim_create_augroup('Copilot', { clear = true })
vim.api.nvim_create_autocmd('InsertEnter', {
    group = 'Copilot',
    callback = function()
        require("copilot").setup({})
    end
})
