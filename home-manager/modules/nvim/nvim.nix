{ pkgs, ... }:
with pkgs.vimPlugins;
let
  configNoCode = cfg: ''
    if not vim.g.vscode then
      ${cfg}
    end
  '';
  readNoCode = path: configNoCode (builtins.readFile path);
in {
  programs.neovim = {
    enable = true;

    extraLuaConfig = builtins.readFile ./config/init.lua;
    extraLuaPackages = luaPkgs: with luaPkgs; [ jsregexp ];
    plugins = [
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = readNoCode ./config/lsp.lua;
      }
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = readNoCode ./config/catppuccin.lua;
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
      telescope-fzy-native-nvim
      telescope-ui-select-nvim
      telescope-lsp-handlers-nvim
      # sqlite-lua
      # {
      #   plugin = smart-open-nvim;
      #   type = "lua";
      #   config = configNoCode ''
      #     vim.g.sqlite_clib_path = '${pkgs.sqlite.out}/lib/libsqlite3.so'
      #   '';
      # }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = readNoCode ./config/telescope.lua;
      }

      leap-nvim
      {
        plugin = flit-nvim;
        type = "lua";
        config = ''require("flit").setup()'';
      }
      {
        plugin = hop-nvim;
        type = "lua";
        config = builtins.readFile ./config/hop.lua;
      }

      {
        plugin = conform-nvim;
        type = "lua";
        config = readNoCode ./config/conform.lua;
      }

      {
        plugin = copilot-lua;
        type = "lua";
        config = readNoCode ./config/copilot.lua;
      }

      {
        plugin = auto-save-nvim;
        type = "lua";
        config = readNoCode ./config/auto-save.lua;
      }

      {
        plugin = barbar-nvim;
        type = "lua";
        config = readNoCode ./config/barbar.lua;
      }

      {
        plugin = statuscol-nvim;
        type = "lua";
        config = readNoCode ./config/statuscol.lua;
      }

      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = configNoCode ''require("gitsigns").setup()'';
      }

      cmp-nvim-lsp
      luasnip
      cmp_luasnip
      {
        plugin = nvim-cmp;
        type = "lua";
        config = readNoCode ./config/cmp.lua;
      }

      promise-async
      {
        plugin = nvim-ufo;
        type = "lua";
        config = readNoCode ./config/ufo.lua;
      }

      {
        plugin = lualine-nvim;
        type = "lua";
        config = readNoCode ./config/lualine.lua;
      }

      {
        plugin = nvim-autopairs;
        type = "lua";
        config = readNoCode ./config/autopairs.lua;
      }

      {
        plugin = which-key-nvim;
        type = "lua";
        config = readNoCode ./config/which-key.lua;
      }

      nui-nvim
      {
        plugin = neo-tree-nvim;
        type = "lua";
        config = readNoCode ./config/neo-tree.lua;
      }

      FixCursorHold-nvim
      nvim-nio
      {
        plugin = rustaceanvim;
        type = "lua";
        config = readNoCode ./config/rust.lua;
      }
      {
        plugin = neotest;
        type = "lua";
        config = readNoCode ./config/neotest.lua;
      }

      {
        plugin = trouble-nvim;
        type = "lua";
        config = readNoCode ./config/trouble.lua;
      }
    ];
  };
}
