{ pkgs, ... }:

{
  imports = [ ./nushell.nix ];

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
    # Get battery stats and other ACPI info
    acpi
    # Manage audio
    pavucontrol 
  ];
}
