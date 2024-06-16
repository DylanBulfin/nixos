{ config, pkgs, lib, ... }:

{
  imports = [
    ./sway/sway.nix
    ./zsh/zsh.nix
    ./nvim/nvim.nix
  ];

  home.username = "dylan";
  home.homeDirectory = "/home/dylan";

  home.packages = with pkgs; [
    neofetch
    # waybar
    mako
    sway-contrib.grimshot
    wofi
    antidote
    swaybg


    lua-language-server
    nixd
    # nil


    # lspconfig a depedency of neodev, can't install directly
    # vimPlugins.nvim-lspconfig
    # vimPlugins.neodev-nvim
    # vimPlugins.catppuccin-nvim

    # vimPlugins.nvim-treesitter-textsubjects
    # vimPlugins.nvim-treesitter-textobjects
  ];

  programs.foot.enable = true;
  programs.foot.settings = {
    main = {
      font = "Noto Sans Mono:size=11";
    };
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}



