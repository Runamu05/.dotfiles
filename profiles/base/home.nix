{ pkgs, inputs, ... }:

{
  imports = [
    ../../git/git.nix
    ../../user/wm/hyprland.nix
    ../../user/apps/games
    ../../user/apps/socials
    ../../user/apps/editors
    ../../user/apps/others
    ../../user/apps/browsers
    ../../user/shell

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
