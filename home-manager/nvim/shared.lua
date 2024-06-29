-- TODO remove this once I fix lua lsp
-- local vim;

function Colemak()
  vim.keymap.set({ "n", "v" }, "m", "h", { desc = "Left" })
  vim.keymap.set({ "n", "v", "o" }, "n", "j", { desc = "Down" })
  vim.keymap.set({ "n", "v", "o" }, "e", "k", { desc = "Up" })
  vim.keymap.set({ "n", "v" }, "i", "l", { desc = "Right" })

  vim.keymap.set({ "n", "v", "o" }, "j", "e", { desc = "Next end of word" })
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
require("mini.ai").setup()
require("mini.surround").setup()

if vim.g.vscode then
  local vscode = require("vscode-neovim")
  vim.notify = vscode.notify

  local call = function(method)
    return function()
      vscode.call(method)
    end
  end

  -- Generated bindings
  vim.keymap.set("n", "<CR>", call("editor.action.smartSelect.expand"))
  vim.keymap.set("v", "<CR>", call("editor.action.smartSelect.expand"))

  vim.keymap.set("n", "<S-CR>", call("editor.action.smartSelect.shrink"))
  vim.keymap.set("v", "<S-CR>", call("editor.action.smartSelect.shrink"))

  vim.keymap.set("n", "gd", call("editor.action.revealDefinition"))
  vim.keymap.set("v", "gd", call("editor.action.revealDefinition"))

  vim.keymap.set("n", "gg", call("cursorTop"))
  vim.keymap.set("v", "gg", call("cursorTop"))

  vim.keymap.set("n", "gi", call("editor.action.goToImplementation"))
  vim.keymap.set("v", "gi", call("editor.action.goToImplementation"))

  vim.keymap.set("n", "gr", call("editor.action.goToReferences"))
  vim.keymap.set("v", "gr", call("editor.action.goToReferences"))

  vim.keymap.set("n", "zac", call("editor.foldAll"))
  vim.keymap.set("v", "zac", call("editor.foldAll"))

  vim.keymap.set("n", "zae", call("editor.unfoldAll"))
  vim.keymap.set("v", "zae", call("editor.unfoldAll"))

  vim.keymap.set("n", "zo", call("editor.foldAllExcept"))
  vim.keymap.set("v", "zo", call("editor.foldAllExcept"))

  vim.keymap.set("n", "zc", call("editor.fold"))
  vim.keymap.set("v", "zc", call("editor.fold"))

  vim.keymap.set("n", "ze", call("editor.unfold"))
  vim.keymap.set("v", "ze", call("editor.unfold"))


  require("nvim-treesitter.configs").setup({
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
      }
    }
  })

  Colemak()
  return
end

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


Colemak()
