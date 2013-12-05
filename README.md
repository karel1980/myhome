## Myhome

This repository contains config files for my $HOME directory.
Everything is managed by stow.

First steps:

    cd stow
    stow -t $HOME *

Fix any error you find by deleting the offending files and try again until success.
Now restart your shell (or run exec bash).

I use additional stow modules which are on Ubuntu One, see stow/bin/bin/stowit.sh.
The environment variables for this script are in bash/.bashrc.d/10-env.sh
