if not vim.g.vscode then
    require("mini.comment").setup()

    -- lspconfig config
    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = { disable = { "missing-fields" } },
            },
        },
    })

    lspconfig.nixd.setup({})

    -- Neodev config
    require("neodev").setup()

    -- Catppuccin theme
    vim.cmd.colorscheme "catppuccin"

    -- Treesitter config

    -- telescope setup
    require("telescope").setup({
        pickers = {
            find_files = {
                theme = "dropdown",
            },
        },
    })
    -- Base telescope picker keymaps
    local builtin = require("telescope.builtin")
    vim.keymap.set({ "n", "v" }, "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find in workspace" })
    vim.keymap.set({ "n", "v" }, "<leader>bb", builtin.buffers, { desc = "List buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "View help tags" })
    -- Plugin-specific keymaps
    vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "View document symbols" })
    vim.keymap.set("n", "<leader>fr", builtin.grep_string, { desc = "View symbol references" })
    vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "View quickfix list" })
    vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "View commands" })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("lsp_handlers")
    require("telescope").load_extension("ui-select")

    Colemak()
    return
end
