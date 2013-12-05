#!/bin/bash

# All stow modules
if [ -z "$STOW_DATA" ]; then
  echo "STOW_DATA is not set"
fi
cd "$STOW_DATA"
stow -t /home/karel *

if [ -z "$STOW_DATA_EXTRA" ]; then
  echo "STOW_DATA_EXTRA is not set"
fi
# secrets and other stuff I don't want in github are on Ubuntu One:
cd "$STOW_DATA_EXTRA"
stow -t /home/karel *
