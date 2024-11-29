#!/bin/sh
# #!/usr/bin/env bash
## The second should work if the first doesn't

if ! (sudo -v); then
  1>&2 echo "Unable to get sudo auth, aborting"
fi

curl -L --output /home/dylan/Downloads/nixos.zip https://github.com/DylanBulfin/nixos/archive/refs/heads/main.zip
cd /home/dylan/Downloads

nix shell --extra-experimental-features nix-command --extra-experimental-features flakes nixpkgs#unzip --command sh -c "unzip nixos.zip"

chmod +x /home/dylan/Downloads/nixos-main/utils/gitsteps.sh
nix shell --extra-experimental-features nix-command --extra-experimental-features flakes nixpkgs#git --command /home/dylan/Downloads/nixos-main/utils/gitsteps.sh ArgTest
