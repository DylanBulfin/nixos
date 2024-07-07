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
        armcord
        python3
        floorp
        xfce.thunar
        pavucontrol
        
        rustc
        cargo
        rust-analyzer
        rustfmt

        (vscode-with-extensions.override {
          vscodeExtensions = with vscode-extensions; [
            vscode-extensions.asvetliakov.vscode-neovim
            vscode-extensions.github.copilot
            vscode-extensions.github.copilot-chat
            # bbenoist.nix
            vscode-extensions.jnoortheen.nix-ide
            vscode-extensions.sumneko.lua
            vscode-extensions.rust-lang.rust-analyzer
          ];
        })
      ]
    )
    ++
    import ./packages-${device}.nix { inherit pkgs; };
}
