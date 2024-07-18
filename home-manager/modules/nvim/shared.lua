vim.g.mapleader = " "

function Colemak()
  -- Bindings created by neovim-vscode extension for multi-cursor support
  vim.keymap.del("x", "ma")
  vim.keymap.del("x", "mi")
  vim.keymap.del("x", "mA")
  vim.keymap.del("x", "mI")
  vim.keymap.set({ "n", "v" }, "m", "h", { desc = "Left" })
  vim.keymap.set({ "n", "v", "o" }, "n", "j", { desc = "Down" })
  vim.keymap.set({ "n", "v", "o" }, "e", "k", { desc = "Up" })
  vim.keymap.set({ "n", "v" }, "i", "l", { desc = "Right" })

  -- vim.keymap.set({ "n", "v", "o" }, "j", "e", { desc = "Next end of word" })
  vim.keymap.set({ "n", "v" }, "k", "n", { desc = "Next match" })
  vim.keymap.set({ "n", "v" }, "K", "N", { desc = "Previous match" })
  vim.keymap.set({ "n", "v" }, "u", "i", { desc = "Insert mode" })
  vim.keymap.set({ "n", "v" }, "U", "I", { desc = "Insert mode at beginning of line" })
  vim.keymap.set({ "n", "v" }, "l", "u", { desc = "Undo" })
  vim.keymap.set({ "n", "v" }, "L", "<C-r>", { desc = "Redo" })
end

function Qwerty()
  vim.keymap.set({ "n", "v" }, "h", "h", { desc = "Left" })
  vim.keymap.set({ "n", "v", "o" }, "j", "j", { desc = "Down" })
  vim.keymap.set({ "n", "v", "o" }, "k", "k", { desc = "Up" })
  vim.keymap.set({ "n", "v" }, "l", "l", { desc = "Right" })

  vim.keymap.set({ "n", "v", "o" }, "e", "e", { desc = "Next end of word" })
  vim.keymap.set({ "n", "v" }, "n", "n", { desc = "Next match" })
  vim.keymap.set({ "n", "v" }, "N", "N", { desc = "Previous match" })
  vim.keymap.set({ "n", "v" }, "i", "i", { desc = "Insert mode" })
  vim.keymap.set({ "n", "v" }, "I", "I", { desc = "Insert mode at beginning of line" })
  vim.keymap.set({ "n", "v" }, "u", "u", { desc = "Undo" })
  vim.keymap.set({ "n", "v" }, "U", "<C-r>", { desc = "Redo" })
end

vim.api.nvim_create_user_command("Colemak", function()
  Colemak()
end, {
  desc = "Set keybindings to Colemak",
})

vim.api.nvim_create_user_command("Qwerty", function()
  Qwerty()
end, {
  desc = "Set keybindings to Qwerty",
})

-- mini.nvim config
require("mini.ai").setup({
  mappings = {
    around = 'a',
    inside = 'b',

    around_next = 'an',
    inside_next = 'bn',
    around_last = 'al',
    inside_last = 'bl',
  },

  n_lines = 150,
})
require("mini.surround").setup()
require("mini.move").setup({
  {
    mappings = {
      -- Move current seletion in Visual mode
      left = '<M-m>',
      right = '<M-i>',
      down = '<M-n>',
      up = '<M-e>',

      -- Move current line in Normal mode
      line_left = '<M-m>',
      line_right = '<M-i>',
      line_down = '<M-n>',
      line_up = '<M-e>',
    },

  }
})

-- textobjects/subjects setup
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
        ["bf"] = { query = "@function.inner", desc = "Inside function" },
        ["ac"] = { query = "@class.outer", desc = "Around class" },
        ["bc"] = { query = "@class.inner", desc = "Inside class" },
        ["ab"] = { query = "@block.outer", desc = "Around block" },
        ["bb"] = { query = "@block.inner", desc = "Inside block" },
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

-- flit (helix-style multi-line ftFT)
require("flit").setup()

-- leap (jump around screen)
vim.keymap.set('n',        'j', '<Plug>(leap)')
vim.keymap.set('n',        'J', '<Plug>(leap-from-window)')
vim.keymap.set({'x', 'o'}, 'j', '<Plug>(leap-forward)')
vim.keymap.set({'x', 'o'}, 'J', '<Plug>(leap-backward)')
vim.keymap.set({'n', 'x', 'o'}, 'gj', '<Plug>(leap-from-window)')