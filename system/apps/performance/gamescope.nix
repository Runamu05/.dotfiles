{ pkgs, ... }:

{
  programs.gamescope = {
    enable = true;
    env = {
      "XKB_DEFAULT_LAYOUT" = "de";
      "XKB_DEFAULT_VARIANT" = "nodeadkeys";
      "-W" = "1920";
      "-w" = "1920";
      "-H" = "1080";
      "-h" = "1080";
      "-r" = "60";
      "--backend" = "wayland";
      #"MANGOHUD_CONFIGFILE" = "$HOME/.config/MangoHud/MangoHud.conf";
    };
    args = [
      "-f"
      "-e"
      "--force-windows-fullscreen"
      "--mangoapp"
    ];
  };
}
