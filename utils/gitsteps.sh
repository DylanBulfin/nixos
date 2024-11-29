#!/bin/sh
# #!/usr/bin/env bash
## The second should work if the first doesn't

nixosdir="/etc/nixos"

# Need the config to be a git repository, this is why we re-download
# cd $nixosdir
# rm -rf *
#
# git clone https://github.com/DylanBulfin/nixos .

echo $@
echo testing
echo $#
