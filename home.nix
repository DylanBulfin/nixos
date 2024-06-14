{ config, pkgs, ...}:

{
  home.username = "dylan";
  home.homeDirectory = "/home/dylan";

  home.packages = with pkgs; [
    neofetch
  ];

  programs.neovim = {  
    enable = true;
    extraConfig = ''
      lua << EOF
        vim.keymap.set({ "n", "v" }, "m", "h", { desc = "Left" })
      EOF
    '';
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
