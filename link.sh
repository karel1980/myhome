#!/bin/bash

function link() {
  MYHOME="$1"

  if [ ! -e "$MYHOME" ]; then
    echo $MYHOME does not exist. skipped.
    return
  fi
  echo "Linking to $MYHOME"

  # make the directories:
  (cd "$MYHOME"; find . -type d -exec mkdir -p "$HOME"/{} ';')

  # symlink files:
  (cd "$MYHOME"; find . -type f \! -name '*.swp' -exec ln -sf "$MYHOME"/{} "$HOME"/{} \;)
}

link "$(cd $(dirname $0); pwd)/home"
link "$HOME/Ubuntu One/personal/myhome-secret"
link "$HOME/Ubuntu One/personal/myhome-misc"
