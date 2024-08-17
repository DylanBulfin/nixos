local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = { disable = { "missing-fields" } },
        },
    },
})

lspconfig.nixd.setup({})
