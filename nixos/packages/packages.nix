{ pkgs, device, ... }:

{
  environment.systemPackages = (with pkgs; [
    nixpkgs-fmt
    vim
    wl-clipboard
    git
    xfce.thunar
    pavucontrol
    discord
    htop
    fd
    feh
    vlc
    sqlite

    # node
    nodejs

    # rust
    stable.rustc
    stable.cargo
    stable.rust-analyzer
    stable.rustfmt
    stable.clippy

    # C(++)
    gcc
    gnumake

    # Go
    go
    gopls

    # nix
    nil
    nixd
    nixfmt-classic

    # Python
    # pyright
    # poetry
    # (python3.withPackages
    #   (python-pkgs: with python-pkgs; [ requests pygments ]))

    # Haskell
    (haskellPackages.ghcWithPackages (pkgs: with pkgs; [ cabal-install ]))

    # Lua
    lua-language-server
    stylua

    # For sway
    sway-contrib.grimshot
    wofi
    antidote
    swaybg

    ripgrep
    bat-extras.batman
    bat-extras.batgrep

    obsidian

    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        asvetliakov.vscode-neovim
        github.copilot
        github.copilot-chat
        # bbenoist.nix
        jnoortheen.nix-ide
        sumneko.lua
        rust-lang.rust-analyzer
        vadimcn.vscode-lldb
        mechatroner.rainbow-csv
        haskell.haskell
        justusadam.language-haskell
        # ms-python.python
        # ms-python.vscode-pylance
        # ms-python.debugpy
        tamasfe.even-better-toml
      ];
    })

    # android-studio
    fzy
    # typescript

    # Trash management
    trashy

    # Postman replacement
    # hoppscotch

    qbittorrent
    mullvad-vpn

    # Static site generation
    zola

# Games
    # clonehero
    # lutris
  ]) ++ import ./packages-${device}.nix { inherit pkgs; };
}
