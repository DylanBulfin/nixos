{
  description = "A NixOS flake I stole";

  inputs.nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
  inputs.nixpkgs-extra_unstable.url = "github:NixOS/nixpkgs/master";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  inputs.kmonad.url =
    "git+https://github.com/kmonad/kmonad?submodules=1&dir=nix";
  inputs.kmonad.inputs.nixpkgs.follows = "nixpkgs";

  inputs.home-manager.url = "github:nix-community/home-manager/master";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  outputs = inputs@{ nixpkgs, nixpkgs-stable, nixpkgs-extra_unstable, kmonad, home-manager, ... }:
    let
      mkDeviceConfig = dev:
        let
          device = "${dev}";
          overlays = [ ];
        in nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit device nixpkgs-stable nixpkgs-extra_unstable inputs overlays; };
          modules = [
            ./nixos/configuration.nix

            kmonad.nixosModules.default

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.dylan = import ./home-manager/home.nix;
                extraSpecialArgs = { inherit device; };
                sharedModules = [ ];
              };
            }
          ];
        };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./bootstrap-configuration.nix ];
      };
      nixosConfigurations.dylan-desktop = mkDeviceConfig "desktop";
      nixosConfigurations.dylan-laptop = mkDeviceConfig "laptop";
    };
}
