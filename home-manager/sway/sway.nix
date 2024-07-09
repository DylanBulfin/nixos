{ pkgs, device, config, lib, ... }:

{
  imports = [
    ./${device}-sway.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      down = "n";
      # up = "e";
      left = "m";
      right = "i";
      # Use kitty as default terminal
      terminal = "foot";
      startup = [
        { command = "swaybg -i /home/dylan/wallpaper.png -m fill"; }
        { command = "swamsg workspace 3"; }
        { command = "swamsg workspace 2"; }
        { command = "swaymsg workspace 1"; }
      ];
      bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];
      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in
        lib.mkOptionDefault {
          # need to do it this way bc up option doesn't work since mod+e defined already
          "${modifier}+e" = lib.mkForce "focus up";
          "${modifier}+Return" = "exec ${pkgs.foot}/bin/foot";
          "${modifier}+c" = "exec code";
          "${modifier}+o" = "exec firefox";
          "${modifier}+t" = "exec ${pkgs.armcord}/bin/armcord";
          "${modifier}+Shift+s" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot copy area";
          "${modifier}+q" = "kill";
          "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'";
          "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'";
          "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";
        };
    };
  };
}
