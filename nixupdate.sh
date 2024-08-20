#!/bin/sh

# To use in case flake.lock becomes unaccessible
#sudo chown <user> ~/.dotfiles/flake.lock

nix flake update ~/.dotfiles --show-trace
