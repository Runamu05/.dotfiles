{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Wii U Emulator
    cemu
    # Mod manager and launcher for Minecraft Premium
    prismlauncher
  ];
}
