    require("telescope").setup({
        pickers = {
            find_files = {
                theme = "dropdown",
            },
        },
    })
    -- Base telescope picker keymaps
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set({ "n", "v" }, "<leader>bb", builtin.buffers, { desc = "List buffers" })
    -- Plugin-specific keymaps
    vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "View document symbols" })
    vim.keymap.set("n", "<leader>fr", builtin.grep_string, { desc = "View symbol references" })
    vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "View quickfix list" })
    vim.keymap.set("n", "<leader>fp", builtin.commands, { desc = "View commands" })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("lsp_handlers")
    require("telescope").load_extension("ui-select")