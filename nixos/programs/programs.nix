{ pkgs, ... }:

{
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = false;

  programs.firefox.enable = true;

  programs.sway.enable = true;

  programs.light.enable = true;

  programs.thefuck.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall =
      true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.less = {
    enable = true;
    # clearDefaultCommands = true;
    commands = {
      n = "forw-line";
      e = "back-line";
      m = "left-scroll";
      i = "right-scroll";
      q = "quit";
      k = "repeat-search";
      K = "reverse-search";
      g = "goto-line";
      G = "goto-end";
      d = "forw-scroll";
      u = "back-scroll";
      "{" = "forw-bracket {}";
      "}" = "back-bracket {}";
      "(" = "forw-bracket ()";
      ")" = "back-bracket ()";
      "[" = "forw-bracket []";
      "]" = "back-bracket []";
      "/" = "forw-search";
      "?" = "back-search";
      ":q" = "quit";
      "^d" = "forw-screen";
      "^u" = "back-screen";
    };
  };
}
