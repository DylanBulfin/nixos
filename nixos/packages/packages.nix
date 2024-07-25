{ pkgs, device, ... }:

{
  environment.systemPackages =
    (
      with pkgs;
      [
        nixpkgs-fmt
        vim
        wl-clipboard
        git
        xfce.thunar
        pavucontrol
        discord
        htop

        # rust
        rustc
        cargo
        rust-analyzer
        rustfmt
        clippy

        # C(++)
        gcc

        # nix
        nil
        nixd

        # Python
        (python3.withPackages (python-pkgs: with python-pkgs;[
          requests
          pygments
        ]))

        # Lua
        lua-language-server

        # For sway
        mako
        sway-contrib.grimshot
        wofi
        antidote
        swaybg

        page-rs 
        bat-extras.batman

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
            ms-python.python
            ms-python.vscode-pylance
            ms-python.debugpy
            tamasfe.even-better-toml
          ];
        })
      ]
    )
    ++
    import ./packages-${device}.nix { inherit pkgs; };
}
