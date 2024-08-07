{ lib, pkgs, ... }:
let luaFiles = [ ./shared.lua ./vscode.lua ./nvim.lua ];
in {
  programs.neovim = {
    enable = true;

    extraLuaConfig = lib.concatMapStringsSep "\n\n" lib.fileContents luaFiles;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      neodev-nvim
      catppuccin-nvim

      nvim-treesitter
      nvim-treesitter-textsubjects
      nvim-treesitter-textobjects
      
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.toml
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.regex
      nvim-treesitter-parsers.haskell
      nvim-treesitter-parsers.python
      
      mini-nvim
      
      plenary-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      telescope-lsp-handlers-nvim
      telescope-nvim 
      
      leap-nvim
      flit-nvim
      hop-nvim
    ];
  };
}
