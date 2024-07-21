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

  -- Bindings created by neovim-vscode extension for multi-cursor support
  -- vim.keymap.del("x", "ma")
  -- vim.keymap.del("x", "mi")
  -- vim.keymap.del("x", "mA")
  -- vim.keymap.del("x", "mI")
  Colemak()

  return
end
