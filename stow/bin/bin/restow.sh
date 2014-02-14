#!/bin/bash

function stow_dir() {
  if [ ! -d "$1" ]; then
    echo "$1 doesn't look like a directory."
    return
  fi
  if ! cd "$1"; then
    echo "cd \"$1\" failed. Skipping dir"
    return
  fi

  echo running stow in $1
  stow --no-folding -t /home/karel *
}

if [ -z "$STOW_DATA" ]; then
  echo "STOW_DATA is empty"
else
  stow_dir "$STOW_DATA"
fi

if [ -z "$STOW_DATA_EXTRA" ]; then
  echo "STOW_DATA_EXTRA is empty"
else
  stow_dir "$STOW_DATA_EXTRA"
fi

