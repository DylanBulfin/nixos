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