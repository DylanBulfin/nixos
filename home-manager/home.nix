{ pkgs, device, ... }:

{
  imports = [
    ./sway/desktop-sway.nix
    ./zsh/zsh.nix
    ./nvim/nvim.nix
    ./firefox/firefox.nix
  ];

  home.username = "dylan";
  home.homeDirectory = "/home/dylan";

  home.packages = with pkgs; [
    mako
    sway-contrib.grimshot
    wofi
    antidote
    swaybg

    lua-language-server
    nixd
  ];

  services.network-manager-applet.enable = true;

  programs.foot.enable = true;
  programs.foot.settings = {
    main = {
      font = "Noto Sans Mono:size=11";
    };
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}




