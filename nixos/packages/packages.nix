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
        python3
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

        # Lua
        lua-language-server

        # For sway
        mako
        sway-contrib.grimshot
        wofi
        antidote
        swaybg

        page-rs

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
          ];
        })
      ]
    )
    ++
    import ./packages-${device}.nix { inherit pkgs; };
}
