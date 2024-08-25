{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
    curl
    neofetch
    # Get system stats
    htop
    btop
    # Manage audio
    pavucontrol
  ];
}
