{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Download manager via HTTPS, HTTP, FTP
    wget
    # Transfer data via URL syntax
    curl
    # Get general system info
    neofetch
    # Get system stats
    htop
    btop
    # Manage audio
    pavucontrol
  ];
}
