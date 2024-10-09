{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Wii U Emulator
    cemu
    # BoTW Mod Manager
    ukmm
    # Mod manager and launcher for Minecraft Premium
    prismlauncher
    # Native GOG, Epic, and Amazon Games Launcher 
    heroic
  ];
}
