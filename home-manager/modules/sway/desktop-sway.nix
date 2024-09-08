{ config, lib, pkgs, ... }:
{
  wayland.windowManager.sway.config = {
    menu = "${pkgs.wofi}/bin/wofi --show drun --monitor DP-1";
    window.hideEdgeBorders = "both";
    window.titlebar = false;
    window.commands = [
      {
        command = "move to workspace 2; workspace 2";
        criteria = {
          app_id = "foot";
        };
      }
      {
        command = "move to workspace 3; workspace 3";
        criteria = {
          app_id = "firefox";
        };
      }
      {
        command = "move to workspace 5; workspace 5";
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
        command = "move to workspace 7; workspace 7";
        criteria = {
          app_id = "thunar";
        };
      }
    ];
    output = {
      DP-1 = {
        mode = "2560x1440";
        position = "5120,0";
      };
      DP-2 = {
        mode = "2560x1440";
        position = "0,0";
      };
      DP-3 = {
        mode = "2560x1440";
        position = "2560,0";
      };
    };
    workspaceOutputAssign = [
      { output = "DP-3"; workspace = "2"; }
      { output = "DP-3"; workspace = "5"; }
      { output = "DP-3"; workspace = "8"; }
      { output = "DP-1"; workspace = "3"; }
      { output = "DP-1"; workspace = "6"; }
      { output = "DP-1"; workspace = "9"; }
      { output = "DP-2"; workspace = "1"; }
      { output = "DP-2"; workspace = "4"; }
      { output = "DP-2"; workspace = "7"; }
    ];
  };
}
