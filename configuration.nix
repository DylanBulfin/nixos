# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.kmonad = {
    enable = true;
    keyboards = {
      myKMonadOutput = {
        device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
        config = builtins.readFile ./laptop.kbd;
      };
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dylan = {
    isNormalUser = true;
    description = "dylan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;
  programs.hyprland.enable = true;

  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
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

            vim.keymap.del({ "x", "o" }, "if")
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
  };
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    nil
    vim
    helix
    foot
    alacritty
    wl-clipboard
    git
    armcord

    
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        vscode-extensions.asvetliakov.vscode-neovim
      ];
    })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
