{ config, lib, pkgs, ... }:
{
  programs.waybar.enable = true;

  programs.waybar.style = ./style.css;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "sway/window" ];
      modules-right = [ "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "battery" "clock" ];
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
      "battery" = {
        "states" = {
          # "good"= 95;
          "warning" = 30;
          "critical" = 15;
        };
        "format" = "{capacity}% {icon}";
        "format-charging" = "{capacity}% ";
        "format-plugged" = "{capacity}% ";
        "format-alt" = "{time} {icon}";
        # "format-good"= "", // An empty format will hide the module
        # "format-full"= "";
        "format-icons" = [ "" "" "" "" "" ];
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

  home.file."wallpaper.png".source = ./wallpaper.png;

  wayland.windowManager.sway.config = {
    menu = "${pkgs.wofi}/bin/wofi --show drun --monitor DP-1";
    window.hideEdgeBorders = "both";
    window.titlebar = false;
    assigns = {
      "2" = [{ app_id = "^foot$"; }];
      "5" = [{ app_id = "^Code$"; }];
      "4" = [{ app_id = "^thunar$"; }];
    };
    output = {
      DP-1 = {
        mode = "2560x1440";
        position = "2560,0";
      };
      DP-2 = {
        mode = "2560x1440";
        position = "5120,0";
      };
      DP-3 = {
        mode = "2560x1440";
        position = "0,0";
      };
    };
    workspaceOutputAssign = [
      { output = "DP-1"; workspace = "2"; }
      { output = "DP-1"; workspace = "5"; }
      { output = "DP-1"; workspace = "8"; }
      { output = "DP-2"; workspace = "3"; }
      { output = "DP-2"; workspace = "6"; }
      { output = "DP-2"; workspace = "9"; }
      { output = "DP-3"; workspace = "1"; }
      { output = "DP-3"; workspace = "4"; }
      { output = "DP-3"; workspace = "7"; }
    ];
  };

  programs.wofi.enable = true;
  programs.wofi.settings = {
    columns = 2;
  };
  programs.wofi.style =
    ''
      * {
      font-family: monospace;
      }

      window {
      background-color: #7c818c;
      }
    ''
  ;

}
