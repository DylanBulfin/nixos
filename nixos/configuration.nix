# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, device, inputs, overlays, nixpkgs-stable, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware/${device}-hardware.nix
    ./packages/packages.nix
    ./modules/kmonad/kmonad.nix
    ./modules/firefox/firefox.nix
    ./programs/programs.nix
    ./services/services.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.systemd-boot = {
    enable = true;
    consoleMode = "0";
    configurationLimit = 5;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Added as part of nixd install instructions
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (final: prev: {
      stable = import nixpkgs-stable {
        system = prev.system;
        config.allowUnfree = true;
      };
    })
  ] ++ overlays;

  hardware.keyboard.qmk.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot =
    true; # powers up the default Bluetooth controller on boot

  security.rtkit.enable = true;
  security.polkit.enable = true;

  security.sudo = {
    enable = true;
    extraConfig = "Defaults pwfeedback";
  };

  networking.hostName = "dylan-${device}";
  networking.networkmanager.enable = true;

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

  # Needed for some zsh completion (e.g. systemd)
  environment.pathsToLink = [ "/share/zsh" ];
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";

    # What interrupts ctrl+backspace in zsh
    WORDCHARS = "*?_-.[]~=&;!#$%^(){}<>";
    # What characters are removed after tab-completion in zsh
    ZLE_REMOVE_SUFFIX_CHARS = ''
      ;
      C-M	'';

    PAGER = "bat";
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.dylan = {
    isNormalUser = true;
    description = "dylan";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILS8AaOSiRHEG4Egsvkms/s7e3Xqt1+G08ap9oB+egL5 dylan@nixos"
    ];
  };

  time.timeZone = "America/New_York";

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    meslo-lgs-nf

    monaspace

    courier-prime
  ];

  system.stateVersion = "24.05"; # Don't change unless needed
}
