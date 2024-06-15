{ config, pkgs, lib, ... }:

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
    antidote
    swaybg
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
        "format" = "{volume}% {icon}   {format_source}";
        "format-bluetooth" = "{volume}% {icon} {format_source}";
        "format-bluetooth-muted" = " {icon} {format_source}";
        "format-muted" = " {format_source}";
        "format-source" = "{volume}% ";
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
        { command = "swaybg -i /home/dylan/wallpaper.png -m fill"; }
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

  home.file.".p10k.zsh".source = ./.p10k.zsh;
  programs.zsh.enable = true;
  # programs.zsh.antidote.enable = true;
  programs.zsh.enableCompletion = false;
  # programs.zsh.antidote.plugins = [
  # "zsh-users/zsh-autosuggestions"
  # "marlonrichert/zsh-autocomplete"
  #   "desyncr/auto-ls"
  #   "jeffreytse/zsh-vi-mode"
  #   "romkatv/powerlevel10k"
  #   "zsh-users/zsh-syntax-highlighting"
  #   "zsh-users/zsh-history-substring-search"
  # ];


  programs.zsh.plugins = [
    {
      name = "zsh-autosuggestions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "c3d4e576c9c86eac62884bd47c01f6faed043fc5";
        sha256 = "B+Kz3B7d97CM/3ztpQyVkE6EfMipVF8Y4HJNfSRXHtU=";
      };
    }
    {
      name = "zsh-autocomplete";
      src = pkgs.fetchFromGitHub {
        owner = "marlonrichert";
        repo = "zsh-autocomplete";
        rev = "196810035992abea65e54852c4278af2069ee482";
        sha256 = "bzOTeYWrzuYNbeat30zijKJ9kflRhdE/0wD2HwZWXbU=";
      };
    }
    {
      name = "auto-ls";
      src = pkgs.fetchFromGitHub {
        owner = "desyncr";
        repo = "auto-ls";
        rev = "a7a7e6c16407a3c4a46319f5f111a827468a0943";
        sha256 = "HMfC4s7KW4bO7H6RYzLnSARoFr1Ez89Z2VGONKMpGbw=";
      };
    }
    {
      name = "zsh-vi-mode";
      src = pkgs.fetchFromGitHub {
        owner = "jeffreytse";
        repo = "zsh-vi-mode";
        rev = "287efa19ec492b2f24bb93d1f4eaac3049743a63";
        sha256 = "HMfC4s7KW4bO7H6RYzLnSARoFr1Ez89Z2VGONKMpGbw=";
      };
    }
    {
      name = "powerlevel10k";
      src = pkgs.fetchFromGitHub {
        owner = "romkatv";
        repo = "powerlevel10k";
        rev = "bde5ca4c2aa6e0c52dd7f15cf216dffdb1ec788c";
        sha256 = "IA2pPW8WT/9/jz/+5zDwedkYz+rzyCy0DRnIvDh9zac=";
      };
    }
    {
      name = "catppuccin-zsh-syntax-highlighting";
      file = "themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "zsh-syntax-highlighting";
        rev = "06d519c20798f0ebe275fc3a8101841faaeee8ea";
        sha256 = "Q7KmwUd9fblprL55W0Sf4g7lRcemnhjh4/v+TacJSfo=";
      };
    }
    {
      name = "zsh-syntax-highlighting";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "e0165eaa730dd0fa321a6a6de74f092fe87630b0";
        sha256 = "4rW2N+ankAH4sA6Sa5mr9IKsdAg7WTgrmyqJ2V1vygQ=";
      };
    }
    {
      name = "zsh-history-substring-search";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-history-substring-search";
        rev = "87ce96b1862928d84b1afe7c173316614b30e301";
        sha256 = "1+w0AeVJtu1EK5iNVwk3loenFuIyVlQmlw8TWliHZGI=";
      };
    }
  ];

  programs.zsh.initExtra = ''
    [[ ! -f /home/dylan/.p10k.zsh ]] || source /home/dylan/.p10k.zsh
    
    bindkey "key[Up]" up-line-or-search
  '';

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;

  programs.foot.enable = true;
  programs.foot.settings = {
    main = {
      font = "Noto Sans Mono:size=11";
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
