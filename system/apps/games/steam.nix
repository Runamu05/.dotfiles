{ pkgs, ... }:

{
programs.steam.enable = true;
programs.steam.gamescopeSession.enable = true;

environment.systemPackages = with pkgs; [
  steam
  mangohud
  protonup
  ];

environment.sessionVariables = {
  STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "/home/runamu/.steam/root/compatibilitytools.d";

  programs.gamemode.enable = true;
};
}

