{ ... }:
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      lua << EOF
          function colemak()
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

          function qwerty()
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
            colemak()
          end, {
            desc = "Set keybindings to Colemak",
          })

          vim.api.nvim_create_user_command("Qwerty", function()
            require("keyboard").qwerty()
          end, {
            desc = "Set keybindings to Qwerty",
          })
          
          local vscode = require("vscode-neovim")
          vim.notify = vscode.notify

          local call = function(method)
            return function()
              vscode.call(method)
            end
          end 

          colemak()

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
      EOF
    '';
  };
}
