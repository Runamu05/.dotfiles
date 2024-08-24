{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Compress/Decompress archives
    ark
    # Rescue tool for file systems
    ddrescue
    # Autoexplicative
    appimage-run
    # Connect to another device
    kdeconnect
  ];
}
