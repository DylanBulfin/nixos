require("neotest").setup({
    adapters = {
        require('rustaceanvim.neotest')
    },
})

vim.keymap.set("n", "<leader>tt", function()
    local nt = require("neotest")
    nt.run.run()
    nt.output.focus()
end)