local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = { disable = { "missing-fields" } },
        },
    },
})

lspconfig.nixd.setup({})

local group = vim.api.nvim_create_augroup("UserLspConfig", {})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = function(desc)
            return { buffer = ev.buf, desc = desc }
        end
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
        vim.keymap.set("n", "gu", vim.lsp.buf.implementation, opts("Go to implementation"))
        vim.keymap.set("n", "E", vim.lsp.buf.hover, opts("Hover"))
        vim.keymap.set("n", "gE", function()
            vim.lsp.buf.hover()
            vim.lsp.buf.hover()
        end, opts("Go to hover window"))
        vim.keymap.set("n", "<C-e>", vim.lsp.buf.signature_help, opts("Signature help"))
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts("Type definition"))
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts("Rename symbol"))
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts("Code actions"))
        vim.keymap.set({ "n", "v" }, "<space>cA", function()
            vim.lsp.buf.code_action({ apply = true })
        end, opts("Code actions"))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Go to references"))
    end,
})
