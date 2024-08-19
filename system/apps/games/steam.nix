{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [ protonup ];

  environment.sessionVariables = {
     STEAM_EXTRA_COMPAT_TOOLS_PATHS =
        "/home/runamu/.steam/root/compatibilitytools.d";
  };
}

