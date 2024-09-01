{ pkgs, inputs, ... }:

{
  imports = [
    ../../user/wm/hyprland/default.nix
    ../../user/apps
    ../../user/shell
    ../../user/apps/games.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_ : true);
  };

  home.username = "runamu";
  home.homeDirectory = "/home/runamu";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [];

  programs.home-manager.enable = true;

  nixpkgs.config.rocmSupport=true;
}
