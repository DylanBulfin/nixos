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

        (vscode-with-extensions.override {
          vscodeExtensions = with vscode-extensions; [
            vscode-extensions.asvetliakov.vscode-neovim
            vscode-extensions.github.copilot
            vscode-extensions.github.copilot-chat
            # bbenoist.nix
            vscode-extensions.jnoortheen.nix-ide
            vscode-extensions.sumneko.lua
          ];
        })
      ]
    )
    ++
    import ./${device}.nix { inherit pkgs; };
}
