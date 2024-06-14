{
  description = "A NixOS flake I stole";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  inputs.kmonad.url = "git+https://github.com/kmonad/kmonad?submodules=1&dir=nix";
  inputs.kmonad.inputs.nixpkgs.follows = "nixpkgs";

  outputs = inputs@{ self, nixpkgs, kmonad, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        kmonad.nixosModules.default
      ];
    };
  };
}
