{ pkgs, device, config, lib, ... }:

{
  imports = [
    ./${device}-sway.nix
  ];
  
  programs.waybar.enable = true;
  home.file."wallpaper.png".source = ./wallpaper.png;

  programs.waybar.style = ./style.css;

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "sway/window" ];
      modules-right = [ "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" ]
        ++ (if device == "laptop" then [ "battery" ] else [ ])
        ++ [ "clock" ];
      "clock" = {
        # "timezone"= "America/New_York",
        "tooltip-format" = "<big>{=%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        "format-alt" = "{=%Y-%m-%d}";
      };
      "cpu" = {
        "format" = "{usage}% ";
        "tooltip" = false;
      };
      "memory" = {
        "format" = "{}% ";
      };
      "temperature" = {
        # "thermal-zone"= 2;
        # "hwmon-path"= "/sys/class/hwmon/hwmon2/temp1_input";
        "critical-threshold" = 80;
        # "format-critical"= "{temperatureC}°C {icon}";
        "format" = "{temperatureC}°C {icon}";
        "format-icons" = [ "" "" "" ];
      };
      "backlight" = {
        # "device"= "acpi_video1";
        "format" = "{percent}% {icon}";
        "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
      };
      "network" = {
        # "interface"= "wlp2*", // (Optional) To force the use of this interface
        "format-wifi" = "{essid} ({signalStrength}%) ";
        "format-ethernet" = "{ipaddr}/{cidr} ";
        "tooltip-format" = "{ifname} via {gwaddr} ";
        "format-linked" = "{ifname} (No IP) ";
        "format-disconnected" = "Disconnected ⚠";
        "format-alt" = "{ifname}= {ipaddr}/{cidr}";
      };
      "pulseaudio" = {
        # "scroll-step"= 1, // %, can be a float
        "format" = "{volume}% {icon}    {format_source}";
        "format-bluetooth" = "{volume}% {icon}     {format_source}";
        "format-bluetooth-muted" = " {icon}     {format_source}";
        "format-muted" = "     {format_source}";
        "format-source" = "{volume}%     ";
        "format-source-muted" = "";
        "format-icons" = {
          "headphone" = "";
          "hands-free" = "";
          "headset" = "";
          "phone" = "";
          "portable" = "";
          "car" = "";
          "default" = [ "" "" "" ];
        };
        "on-click" = "pavucontrol";
      };
    };
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
