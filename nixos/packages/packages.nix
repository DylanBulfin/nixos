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


        (vscode-with-extensions.override {
          vscodeExtensions = with vscode-extensions; [
            vscode-extensions.asvetliakov.vscode-neovim
            vscode-extensions.github.copilot
            vscode-extensions.github.copilot-chat
            # bbenoist.nix
            vscode-extensions.jnoortheen.nix-ide
            vscode-extensions.sumneko.lua
            vscode-extensions.rust-lang.rust-analyzer
            vscode-extensions.vadimcn.vscode-lldb
          ];
        })
      ]
    )
    ++
    import ./packages-${device}.nix { inherit pkgs; };
}
