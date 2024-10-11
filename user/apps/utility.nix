{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Compress/Decompress archives
    ark
    unrar
    # Rescue tool for file systems
    ddrescue
    # Autoexplicative
    appimage-run
    # Connect to another device
    kdeconnect
    # OS Virtualization
    gnome-boxes
  ];
}
