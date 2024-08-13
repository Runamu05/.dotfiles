{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ alacritty ];

  programs.alacritty.enable = true;
}
