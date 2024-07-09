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
    menu = "${pkgs.wofi}/bin/wofi --show drun";
    window.hideEdgeBorders = "both";
    window.titlebar = false;
    window.commands = [
      {
        command = "move to workspace 1; workspace 1";
        criteria = {
          app_id = "foot";
        };
      }
      {
        command = "move to workspace 2; workspace 2";
        criteria = {
          app_id = "firefox";
        };
      }
      {
        command = "move to workspace 3; workspace 3";
        criteria = {
          class = "Code";
        };
      }
      {
        command = "move to workspace 4; workspace 4";
        criteria = {
          class = "ArmCord";
        };
      }
      {
        command = "move to workspace 5; workspace 5";
        criteria = {
          app_id = "thunar";
        };
      }
    ];
    input = {
      "*" = {
        tap = "enabled";
        drag = "enabled";
        natural_scroll = "enabled";
        click_method = "clickfinger";
        scroll_factor = "0.15";
      };
    };
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
