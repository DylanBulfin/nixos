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

  programs.bash.enable = true;

  programs.foot.enable = true;
  programs.foot.settings = {
    main = {
      font = "Noto Sans Mono:size=11";
    };
  };
  
  programs.page-rs.enable = true;
  
  programs.broot.enable = true;
  
  services.wlsunset.enable = true;
  services.wlsunset.sunset = "19:00";
  services.wlsunset.sunrise = "09:00";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}




