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
