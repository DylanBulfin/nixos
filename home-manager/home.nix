{ pkgs, device, ... }:

{
  imports = [
    ./sway/sway.nix
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

  programs.foot.enable = true;
  programs.foot.settings = {
    main = {
      font = "Noto Sans Mono:size=11";
    };
  };
  
  programs.broot.enable = true;

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}




