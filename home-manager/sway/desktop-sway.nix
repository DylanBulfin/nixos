{ config, lib, pkgs, ... }:
{
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
