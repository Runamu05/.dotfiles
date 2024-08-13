{ config, pkgs, ... }:

{
  imports = [
    ./pipewire.nix
  ];

  environment.systemPackages = [ pkgs.wayland ];

  # Configure xwayland
  services = {
    xserver = {
      xkb = {
        layout = "de";
        variant = "nodeadkeys";
      };
      enable = true;
    };
  };
}
