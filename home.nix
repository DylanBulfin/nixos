{ config, pkgs, lib, ...}:

{
  imports = [
    ./dconf.nix
  ];

  home.username = "dylan";
  home.homeDirectory = "/home/dylan";

  home.packages = with pkgs; [
    neofetch
    # waybar
    mako
    sway-contrib.grimshot
    wofi
  ];

  programs.neovim = {  
    enable = true;
    extraConfig = ''
      lua << EOF
          function colemak()
            vim.keymap.set({ "n", "v" }, "m", "h", { desc = "Left" })
            vim.keymap.set({ "n", "v", "o" }, "n", "j", { desc = "Down" })
            vim.keymap.set({ "n", "v", "o" }, "e", "k", { desc = "Up" })
            vim.keymap.set({ "n", "v" }, "i", "l", { desc = "Right" })

            vim.keymap.set({ "n", "v", "o" }, "j", "e", { desc = "Next end of word" })
            vim.keymap.set({ "n", "v" }, "k", "n", { desc = "Next match" })
            vim.keymap.set({ "n", "v" }, "K", "N", { desc = "Previous match" })
            vim.keymap.set({ "n", "v" }, "u", "i", { desc = "Insert mode" })
            vim.keymap.set({ "n", "v" }, "U", "I", { desc = "Insert mode at beginning of line" })
            vim.keymap.set({ "n", "v" }, "l", "u", { desc = "Undo" })
            vim.keymap.set({ "n", "v" }, "L", "<C-r>", { desc = "Redo" })
          end

          function qwerty()
            vim.keymap.set({ "n", "v" }, "h", "h", { desc = "Left" })
            vim.keymap.set({ "n", "v", "o" }, "j", "j", { desc = "Down" })
            vim.keymap.set({ "n", "v", "o" }, "k", "k", { desc = "Up" })
            vim.keymap.set({ "n", "v" }, "l", "l", { desc = "Right" })

            vim.keymap.set({ "n", "v", "o" }, "e", "e", { desc = "Next end of word" })
            vim.keymap.set({ "n", "v" }, "n", "n", { desc = "Next match" })
            vim.keymap.set({ "n", "v" }, "N", "N", { desc = "Previous match" })
            vim.keymap.set({ "n", "v" }, "i", "i", { desc = "Insert mode" })
            vim.keymap.set({ "n", "v" }, "I", "I", { desc = "Insert mode at beginning of line" })
            vim.keymap.set({ "n", "v" }, "u", "u", { desc = "Undo" })
            vim.keymap.set({ "n", "v" }, "U", "<C-r>", { desc = "Redo" })
          end

          vim.api.nvim_create_user_command("Colemak", function()
            colemak()
          end, {
            desc = "Set keybindings to Colemak",
          })

          vim.api.nvim_create_user_command("Qwerty", function()
            require("keyboard").qwerty()
          end, {
            desc = "Set keybindings to Qwerty",
          })
          
          local vscode = require("vscode-neovim")
          vim.notify = vscode.notify

          local call = function(method)
            return function()
              vscode.call(method)
            end
          end 

          colemak()

          -- Generated bindings
          vim.keymap.set("n", "<CR>", call("editor.action.smartSelect.expand"))
          vim.keymap.set("v", "<CR>", call("editor.action.smartSelect.expand"))

          vim.keymap.set("n", "<S-CR>", call("editor.action.smartSelect.shrink"))
          vim.keymap.set("v", "<S-CR>", call("editor.action.smartSelect.shrink"))

          vim.keymap.set("n", "gd", call("editor.action.revealDefinition"))
          vim.keymap.set("v", "gd", call("editor.action.revealDefinition"))

          vim.keymap.set("n", "gg", call("cursorTop"))
          vim.keymap.set("v", "gg", call("cursorTop"))

          vim.keymap.set("n", "gi", call("editor.action.goToImplementation"))
          vim.keymap.set("v", "gi", call("editor.action.goToImplementation"))

          vim.keymap.set("n", "gr", call("editor.action.goToReferences"))
          vim.keymap.set("v", "gr", call("editor.action.goToReferences"))

          vim.keymap.set("n", "zac", call("editor.foldAll"))
          vim.keymap.set("v", "zac", call("editor.foldAll"))

          vim.keymap.set("n", "zae", call("editor.unfoldAll"))
          vim.keymap.set("v", "zae", call("editor.unfoldAll"))

          vim.keymap.set("n", "zo", call("editor.foldAllExcept"))
          vim.keymap.set("v", "zo", call("editor.foldAllExcept"))

          vim.keymap.set("n", "zc", call("editor.fold"))
          vim.keymap.set("v", "zc", call("editor.fold"))

          vim.keymap.set("n", "ze", call("editor.unfold"))
          vim.keymap.set("v", "ze", call("editor.unfold"))   
      EOF
    '';
  };
 /*  
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, F, exec, firefox"
        "$mod, RETURN, exec, foot"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };  
 */
 
  programs.waybar.enable = true;

  programs.waybar.style = ./style.css;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      modules-left= ["sway/workspaces" "sway/mode"];
      modules-center= ["sway/window"];
      modules-right= ["pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "battery" "clock"];
    "clock"= {
        # "timezone"= "America/New_York",
        "tooltip-format"= "<big>{=%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        "format-alt"= "{=%Y-%m-%d}";
    };
    "cpu"= {
        "format"= "{usage}% ";
        "tooltip"= false;
    };
    "memory"= {
        "format"= "{}% ";
    };
    "temperature"= {
        # "thermal-zone"= 2;
        # "hwmon-path"= "/sys/class/hwmon/hwmon2/temp1_input";
        "critical-threshold"= 80;
        # "format-critical"= "{temperatureC}°C {icon}";
        "format"= "{temperatureC}°C {icon}";
        "format-icons"= ["" "" ""];
    };
    "backlight"= {
        # "device"= "acpi_video1";
        "format"= "{percent}% {icon}";
        "format-icons"= ["" "" "" "" "" "" "" "" ""];
    };
    "battery"= {
        "states"= {
            # "good"= 95;
            "warning"= 30;
            "critical"= 15;
        };
        "format"= "{capacity}% {icon}";
        "format-charging"= "{capacity}% ";
        "format-plugged"= "{capacity}% ";
        "format-alt"= "{time} {icon}";
        # "format-good"= "", // An empty format will hide the module
        # "format-full"= "";
        "format-icons"= ["" "" "" "" ""];
    };
    "network"= {
        # "interface"= "wlp2*", // (Optional) To force the use of this interface
        "format-wifi"= "{essid} ({signalStrength}%) ";
        "format-ethernet"= "{ipaddr}/{cidr} ";
        "tooltip-format"= "{ifname} via {gwaddr} ";
        "format-linked"= "{ifname} (No IP) ";
        "format-disconnected"= "Disconnected ⚠";
        "format-alt"= "{ifname}= {ipaddr}/{cidr}";
    };
    "pulseaudio"= {
        # "scroll-step"= 1, // %, can be a float
        "format"= "{volume}% {icon}   {format_source}";
        "format-bluetooth"= "{volume}% {icon} {format_source}";
        "format-bluetooth-muted"= " {icon} {format_source}";
        "format-muted"= " {format_source}";
        "format-source"= "{volume}% ";
        "format-source-muted"= "";
        "format-icons"= {
            "headphone"= "";
            "hands-free"= "";
            "headset"= "";
            "phone"= "";
            "portable"= "";
            "car"= "";
            "default"= ["" "" ""];
        };
        "on-click"= "pavucontrol";
    };
    };

  };
 
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      down = "n";
      # up = "e";
      left = "m";
      right = "i";
      # Use kitty as default terminal
      terminal = "foot"; 
      startup = [
        {command = "swaybg -i Downloads/nixos-wallpaper-catppuccin-mocha.png -m fill";}
      ];
      bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];
      keybindings = 
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in lib.mkOptionDefault {
          # need to do it this way bc up option doesn't work since mod+e defined already
          "${modifier}+e" = lib.mkForce "focus up";
          "${modifier}+Return" = "exec ${pkgs.foot}/bin/foot";
          "${modifier}+c" = "exec code";
          "${modifier}+o" = "exec ${pkgs.firefox}/bin/firefox";
          "${modifier}+t" = "exec ${pkgs.armcord}/bin/armcord";
          "${modifier}+Shift+s" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot copy area";
          "${modifier}+q" = "kill"; 
        };
        
      menu = "${pkgs.wofi}/bin/wofi --show drun";
      window.hideEdgeBorders = "both";
      window.titlebar = false;
      input = {
        "*" = {
          tap = "enabled";
          drag = "enabled";
          natural_scroll = "enabled";
          click_method = "clickfinger";
        };
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
  
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
