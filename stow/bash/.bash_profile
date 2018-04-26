#!/usr/bin/env bash

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Path to the bash it configuration
export BASH_IT="/Users/karelvervaeke/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

source ~/.bashrc

alias npm="aca-npm-tools"
