#!/bin/sh

# Garbage collect system
sudo nix-collect-garbage -d 
# Garbage collect user
nix-collect-garbage -d 
