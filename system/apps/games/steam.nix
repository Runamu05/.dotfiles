{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [ mangohud protonup ];

  environment.sessionVariables = {
     STEAM_EXTRA_COMPAT_TOOLS_PATHS =
        "/home/runamu/.steam/root/compatibilitytools.d";
  };

  programs.gamescope = {
    enable = true;
    env = {
      "XKB_DEFAULT_LAYOUT" = "de";
      "XKB_DEFAULT_VARIANT" = "nodeadkeys";
      "-W" = "1920";
      "-H" = "1080";
      "-w" = "1920";
      "-h" = "1080";
      "-r" = "60";
      "--backend" = "wayland";
    };
    args = [
      "-f"
      "-e"
      "--force-windows-fullscreen"
      "--expose-wayland"
    ];
  };

  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 1;
        desiredgov = "performance";
        igpu_desiredgov = "performance";
      };
      cpu = {
        park_cores = false;
        #pin_cores = "yes";
      };
    };
  };

}

