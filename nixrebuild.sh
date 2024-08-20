#!/bin/sh

sudo nixos-rebuild switch --flake ~/.dotfiles/.#system --show-trace

home-manager switch --flake ~/.dotfiles#user --show-trace
