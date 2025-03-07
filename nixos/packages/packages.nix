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

    # rust nightly
    (fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
    rust-analyzer-nightly

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
    pyright
    poetry
    (python3.withPackages
      (python-pkgs: with python-pkgs; [ requests pygments ]))

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
      vscodeExtensions = with vscode-extensions;
        [
          asvetliakov.vscode-neovim
          github.copilot
          github.copilot-chat
          # bbenoist.nix
          jnoortheen.nix-ide
          sumneko.lua
          # rust-lang.rust-analyzer
          vadimcn.vscode-lldb
          mechatroner.rainbow-csv
          haskell.haskell
          justusadam.language-haskell
          # ms-python.python
          # ms-python.vscode-pylance
          # ms-python.debugpy
          tamasfe.even-better-toml

        ] ++
        # rust-analyzer nightly
        (vscode-utils.extensionsFromVscodeMarketplace [{
          name = "rust-analyzer";
          publisher = "rust-lang";
          version = "0.4.2202";
          sha256 = "sha256-mS6NDP5wl8PNQS0ql9P63YDr6SOO//YxBhLgzqrdCjc=";
        }]);
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

    # QEMU
    qemu
    quickemu

    # Games
    # clonehero
    # lutris
  ]) ++ import ./packages-${device}.nix { inherit pkgs; };
}
