{ config, pkgs, lib, ... }:

{
  imports = [
    ./sway.nix
    ./zsh.nix
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



