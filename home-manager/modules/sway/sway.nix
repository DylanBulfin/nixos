{ pkgs, device, config, lib, ... }:

{
  imports = [
    ./${device}-sway.nix
  ];

  programs.waybar.enable = true;

  programs.waybar.style = ./misc/waybar.css;

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;


      modules-left = [
        "sway/workspaces"
        "sway/mode"
      ];

      "modules-center" = [
      ];

      "modules-right" = [
        "network"
        "memory"
        "cpu"
        "pulseaudio"
        "battery"
        #"custom/PBPbattery"
        "clock"
        "tray"
        #"custom/weather"
        "custom/power"
      ];

      "battery" = {
        "states" = {
          # "good"= 95
          "warning" = 30;
          "critical" = 15;
        };
        "format" = "{capacity}% {icon}";
        "format-charging" = "{capacity}% ";
        "format-plugged" = "{capacity}% ";
        # "format-good"= "", # An empty format will hide the module
        # "format-full"= "",
        "format-icons" = [ "" "" "" "" "" ];
      };

      "clock" = {
        "interval" = 10;
        "format-alt" = " {:%e %b %Y}";
        "format" = "{:%H:%M}";
        "tooltip-format" = "{:%e %B %Y}";
      };

      "cpu" = {
        "interval" = 5;
        "format" = "  {usage}% ({load})";
        "states" = {
          "warning" = 70;
          "critical" = 90;
        };
        "on-click" = "foot -e 'htop'";
      };

      "memory" = {
        "interval" = 5;
        "format" = " {}%";
        "on-click" = "foot -e 'htop'";
        "states" = {
          "warning" = 70;
          "critical" = 90;
        };
      };

      "network" = {
        "interval" = 5;
        "format-wifi" = "  {essid} ({signalStrength}%)";
        "format-ethernet" = "  {ifname}: {ipaddr}/{cidr}";
        "format-disconnected" = "⚠  Disconnected";
        "tooltip-format" = "{ifname}: {ipaddr}";
        "on-click" = "foot -e 'nmtui'";
      };

      "network#vpn" = {
        "interface" = "tun0";
        "format" = "  {essid} ({signalStrength}%)";
        "format-disconnected" = "⚠  Disconnected";
        "tooltip-format" = "{ifname}: {ipaddr}/{cidr}";
      };

      "sway/mode" = {
        "format" = "{}";
        "tooltip" = false;
      };

      "sway/window" = {
        "format" = "{}";
        "max-length" = 120;
      };

      "sway/workspaces" = {
        "disable-scroll" = true;
        "disable-markup" = false;
        "all-outputs" = false;
        "format" = "  {icon}  ";
      };

      "pulseaudio" = {
        "scroll-step" = 1;
        "format" = "{volume}% {icon}";
        "format-bluetooth" = "{volume}% {icon}  {format_source}";
        "format-bluetooth-muted" = " {icon}  {format_source}";
        "format-muted" = " {format_source}";
        "format-source" = "{volume}% ";
        "format-source-muted" = "";
        "format-icons" = {
          "headphone" = "";
          "hands-free" = "וֹ";
          "headset" = "  ";
          "phone" = "";
          "portable" = "";
          "car" = "";
          "default" = [ "" ];
        };
        "on-click" = "pavucontrol";
        "on-scroll-up" = "pactl set-sink-volume @DEFAULT_SINK@ +2%";
        "on-scroll-down" = "pactl set-sink-volume @DEFAULT_SINK@ -2%";
      };

      "tray" = {
        "icon-size" = 18;
        "spacing" = 10;
      };

      "custom/power" = {
        "format" = "⏻";
        "on-click" = "exec /home/dylan/.config/sway/misc/power-menu.sh";
        "tooltip" = false;
      };

    };
  };

  home.file.".config/sway/misc" = {
    source = ./misc;
    recursive = true;
  };

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
        { command = "swaybg -i /home/dylan/.config/sway/misc/wallpaper.png -m fill"; }
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
          # at some point i need to get rid of the defaults
          "${modifier}+e" = lib.mkForce "focus up";
          "${modifier}+Return" = "exec foot";
          "${modifier}+Shift+Return" = "exec foot --app-id alternate";
          "${modifier}+c" = "exec code";
          "${modifier}+o" = "exec firefox";
          "${modifier}+t" = "exec discord";
          "${modifier}+Shift+s" = "exec grimshot copy area";
          "${modifier}+q" = "kill";
          "${modifier}+p" = "exec obsidian";
          "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'";
          "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'";
          "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";
          "XF86MonBrightnessDown" = "exec light -U 10";
          "XF86MonBrightnessUp" = "exec light -A 10";
        };
    };
  };

  programs.wofi.enable = true;
  programs.wofi.settings = {
    width = "25%";
    layer = "overlay";
    # columns = 2;
  };
  programs.wofi.style = builtins.readFile ./misc/wofi.css;
}
