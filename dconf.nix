# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      begin-resize = [ "<Super>r" ];
      close = [ "<Super>q" ];
      maximize = [ "<Super>e" ];
      move-to-workspace-1 = [ "<Shift><Super>1" ];
      move-to-workspace-2 = [ "<Shift><Super>2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" ];
      raise-or-lower = [ "<Super>w" ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-left = [ "<Super>m" ];
      switch-to-workspace-right = [ "<Super>i" ];
      toggle-fullscreen = [ "<Super>f" ];
      unmaximize = [ "<Super>n" ];
    };

    "org/gnome/mutter" = {
      edge-tiling = true;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ "<Shift><Super>m" ];
      toggle-tiled-right = [ "<Shift><Super>i" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" ];
      help = [];
      search = [ "<Super>d" ];
      www = [ "<Super>o" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>c";
      command = "code";
      name = "Code";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>Return";
      command = "foot";
      name = "Foot";
    };

  };
}
