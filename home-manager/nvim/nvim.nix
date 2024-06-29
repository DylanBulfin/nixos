{ lib, pkgs, ... }:
let luaFiles = [ ./shared.lua ./vscode.lua ./nvim.lua ];
in {
  programs.neovim = {
    enable = true;

    extraLuaConfig = lib.concatStrings (map lib.fileContents luaFiles);
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      neodev-nvim
      catppuccin-nvim

      nvim-treesitter
      nvim-treesitter-textsubjects
      nvim-treesitter-textobjects
      nvim-treesitter-parsers.lua
      
      mini-nvim
    ];
  };
}
