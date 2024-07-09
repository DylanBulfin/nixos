{ config, lib, pkgs, ... }:
{
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
          class = "discord";
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

}
