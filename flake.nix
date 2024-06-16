{
  description = "A NixOS flake I stole";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  inputs.kmonad.url = "git+https://github.com/kmonad/kmonad?submodules=1&dir=nix";
  inputs.kmonad.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.home-manager.url = "github:nix-community/home-manager/release-24.05";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  outputs = inputs@{ self, nixpkgs, kmonad, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        
        kmonad.nixosModules.default
        
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.dylan = import ./home-manager/home.nix;
        }
      ];
    };
  };
}
