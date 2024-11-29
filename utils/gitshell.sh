#!/bin/sh
# #!/usr/bin/env bash
## The second should work if the first doesn't

nix shell --extra-experimental-features nix-command --extra-experimental-features flakes git
