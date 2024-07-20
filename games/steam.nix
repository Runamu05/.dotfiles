{ pkgs, ... }:

{
programs.steam.enable = true;
programs.steam.gamescopeSession.enable = true;

environment.systemPackages = with pkgs; [
  steam
  mangohud
  ];

  programs.gamemode.enable = true;
}
