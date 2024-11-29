#!/bin/sh
# #!/usr/bin/env bash
## The second should work if the first doesn't

if ! (sudo -v); then
  1>&2 echo "Unable to get sudo auth, aborting"
  exit 1
fi

if [ "$#" != 1 ]; then 
  1>&2 echo "Wrong number of arguments"
  exit 1
fi

if [ "$1" != "laptop" ] && [ "$1" != "desktop" ]; then
  1>&2 echo "Unsupported argument"
  exit 1
fi

cd /home/dylan
curl -L --output ./gitsteps.sh https://github.com/DylanBulfin/nixos/blob/main/utils/gitshell.sh

chmod +x /home/dylan/gitsteps.sh
nix shell --extra-experimental-features nix-command --extra-experimental-features flakes nixpkgs#git --command /home/dylan/gitsteps.sh $1
