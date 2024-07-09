{ config, lib, pkgs, ... }:
{
  programs.waybar.style = ./style.css;
  programs.waybar.settings.mainBar.battery = {
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
