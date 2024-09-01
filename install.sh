#!/bin/sh

sudo nixos-generate-config --show-hardware-config > ./system/hardware-configuration.nix

sudo nixos-rebuild switch --flake ~/.dotfiles#system

nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.dotfiles#user

mkdir ~/Music/
mkdir ~/Desktop/
mkdir ~/Downloads/  
mkdir ~/Videos/
mkdir ~/Pictures/
mkdir ~/Games/
