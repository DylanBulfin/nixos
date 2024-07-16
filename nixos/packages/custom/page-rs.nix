{ pkgs, ... }:

pkgs.rustPlatform.buildRustPackage rec {
  page-rs = pkgs.rustPlatform.buildRustPackage {
    pname = "page-rs";
    version = "0.1.0";
    src = ./page-rs;

    cargoLock = {
      lockFile = ./page-rs/Cargo.lock;
    };
  };
}
