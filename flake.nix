{
  description = "A NixOS flake I stole";

  inputs.nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  inputs.kmonad.url =
    "git+https://github.com/kmonad/kmonad?submodules=1&dir=nix";
  inputs.kmonad.inputs.nixpkgs.follows = "nixpkgs";

  inputs.home-manager.url = "github:nix-community/home-manager/master";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";

  inputs.fenix.url = "github:nix-community/fenix";
  inputs.fenix.inputs.nixpkgs.follows = "nixpkgs";

  outputs = inputs@{ nixpkgs, nixpkgs-stable, home-manager, fenix, ... }:
    let
      mkDeviceConfig = dev:
        let
          device = "${dev}";
          overlays = [ fenix.overlays.default ];
        in nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit device nixpkgs-stable inputs overlays fenix;
          };
          modules = [
            ./nixos/configuration.nix

            # kmonad.nixosModules.default

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
