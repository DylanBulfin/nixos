{ pkgs, device, ... }:

{
  imports = [
    ./modules/sway/sway.nix
    ./modules/zsh/zsh.nix
    ./modules/nvim/nvim.nix
    ./modules/firefox/firefox.nix
  ];

  home.username = "dylan";
  home.homeDirectory = "/home/dylan";

  home.packages = with pkgs; [
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




