#!/bin/sh
# #!/usr/bin/env bash
## The second should work if the first doesn't

# dylan-laptop or dylan-desktop
device = $1
derivation = dylan-$device

# Need the config to be a git repository, this is why we re-download
cd "/etc/nixos"
rm -rf *

git clone https://github.com/DylanBulfin/nixos .

nixos-generate-config
rm configuration.nix
mv hardware-configuration.nix nixos/hardware/$device-hardware.nix

sudo nixos-rebuild boot --flake .#$derivation
