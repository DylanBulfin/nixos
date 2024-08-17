{ pkgs, ... }:
let
  configNoCode = cfg:
    ''
      if not vim.g.vscode then
        ${cfg}
      end
    ''
  ;
in
{
  programs.neovim = {
    enable = true;

    extraLuaConfig = builtins.readFile ./config/init.lua;
    plugins = with pkgs.vimPlugins; [
      {
        plugin =
          nvim-lspconfig;
        type = "lua";
        config = configNoCode (builtins.readFile ./config/lsp.lua);
      }
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = configNoCode ''vim.cmd.colorscheme "catppuccin"'';
      }

      nvim-treesitter-textsubjects
      nvim-treesitter-textobjects
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.toml
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.regex
      nvim-treesitter-parsers.haskell
      nvim-treesitter-parsers.python
      {
        plugin = nvim-treesitter;
        type = "lua";
        config = builtins.readFile ./config/treesitter.lua;
      }

      {
        plugin = mini-nvim;
        type = "lua";
        config = builtins.readFile ./config/mini.lua;
      }

      plenary-nvim
      nvim-web-devicons
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      telescope-lsp-handlers-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = configNoCode (builtins.readFile ./config/telescope.lua);
      }

      leap-nvim
      {
        plugin = flit-nvim;
        type = "lua";
        config =
          ''require("flit").setup()'';
      }
      {
        plugin = hop-nvim;
        type = "lua";
        config = builtins.readFile ./config/hop.lua;
      }

      {
        plugin = conform-nvim;
        type = "lua";
        config = builtins.readFile ./config/conform.lua;
      }

      {
        plugin = copilot-lua;
        type = "lua";
        config = builtins.readFile ./config/copilot.lua;
      }

      {
        plugin = auto-save-nvim;
        type = "lua";
        config = builtins.readFile ./config/auto-save.lua;
      }
      
      {
        plugin = barbar-nvim;
        type = "lua";
        config = builtins.readFile ./config/barbar.lua;
      }
    ];
  };
}
