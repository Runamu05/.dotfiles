{ pkgs, ... }:

{
  # Configure Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  #hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [ protonup ];

  environment.sessionVariables = {
     STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";

     MANGOHUD_CONFIGFILE = "$HOME/.config/MangoHud/MangoHud.conf";
  };

  # Configure Gamescope
  programs.gamescope = {
    enable = true;
    env = {
      "XKB_DEFAULT_LAYOUT" = "de";
      "XKB_DEFAULT_VARIANT" = "nodeadkeys";
      "-W" = "1920";
      "-H" = "1080";
      "-r" = "60";
      "--backend" = "wayland";
      #"MANGOHUD_CONFIGFILE" = "MANGOHUD_CONFIGFILE";
    };
    args = [
      "-e"
      "-f"
      "--force-windows-fullscreen"
      "--mangoapp"
    ];
  };
}

