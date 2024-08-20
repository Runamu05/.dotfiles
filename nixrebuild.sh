#!/bin/sh

# Rebuild NixOS 
sudo nixos-rebuild switch --flake ~/.dotfiles/.#system --show-trace

home-manager switch --flake ~/.dotfiles#user --show-trace
