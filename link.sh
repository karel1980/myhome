#!/bin/bash

function link() {
  MYHOME="$1"

  if [ ! -e "$MYHOME" ]; then
    echo $MYHOME does not exist. skipped.
    return
  fi

  # make the directories:
  (cd "$MYHOME"; find . -name .git -prune -o -type d -exec mkdir -p "$HOME"/{} ';')

  # remove old files that may be in the way
  (cd "$MYHOME"; find . -type d -name .git -prune -o \! -name '*.swp' \! -name link.sh \! -name README.md -type f -exec rm "$HOME"/{} \;)

  # symlink files:
  (cd "$MYHOME"; find . -type d -name .git -prune -o \! -name '*.swp' \! -name link.sh \! -name README.md -type f -exec ln -sf "$MYHOME"/{} "$HOME"/{} \;)
}

link "$(cd $(dirname $0); pwd)"
link "$HOME/Ubuntu One/personal/myhome-secret"
