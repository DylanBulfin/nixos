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
    require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    -- Select around/inside function/class
                    ["af"] = { query = "@function.outer", desc = "Around function" },
                    ["if"] = { query = "@function.inner", desc = "Inside function" },
                    ["ac"] = { query = "@class.outer", desc = "Around class" },
                    ["ic"] = { query = "@class.inner", desc = "Inside class" },
                    ["ab"] = { query = "@block.outer", desc = "Around block" },
                    ["ib"] = { query = "@block.inner", desc = "Inside block" },
                },
            },
            move = {
                enable = true,
                goto_next_start = {
                    ["]f"] = { query = "@function.outer", desc = "Next function" },
                    ["]c"] = { query = "@class.outer", desc = "Next class start" },
                    ["]b"] = { query = "@block.outer", desc = "Next block start" },
                },
                goto_next_end = {
                    ["]F"] = { query = "@function.outer", desc = "Next function end" },
                    ["]C"] = { query = "@class.outer", desc = "Next class end" },
                    ["]B"] = { query = "@block.outer", desc = "Next block end" },
                },
                goto_previous_start = {
                    ["[f"] = { query = "@function.outer", desc = "Previous function start" },
                    ["[c"] = { query = "@class.outer", desc = "Previous class start" },
                    ["[b"] = { query = "@block.outer", desc = "Previous block start" },
                },
                goto_previous_end = {
                    ["[F"] = { query = "@function.outer", desc = "Previous function end" },
                    ["[C"] = { query = "@class.outer", desc = "Previous class end" },
                    ["[b"] = { query = "@block.outer", desc = "Previous block end" },
                },
            },
        },
        textsubjects = {
            enable = true,
            keymaps = {
                ["<CR>"] = "textsubjects-smart",
            },
        },
    })

    local rp = require("nvim-treesitter.textobjects.repeatable_move")

    -- Make above move commands repeatable with , and ;
    vim.keymap.set({ "n", "x", "o" }, ";", rp.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", rp.repeat_last_move_previous)

    -- Apply same bindings to built in find commands
    vim.keymap.set({ "n", "x", "o" }, "f", rp.builtin_f)
    vim.keymap.set({ "n", "x", "o" }, "F", rp.builtin_F)
    vim.keymap.set({ "n", "x", "o" }, "t", rp.builtin_t)
    vim.keymap.set({ "n", "x", "o" }, "T", rp.builtin_T)

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
