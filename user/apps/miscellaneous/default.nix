{ pkgs, ... }:

{
  imports = [
    ./spicetify.nix
    ./mangohud.nix
  ];

  home.packages = with pkgs; [
    gpt4all
    obs-studio
  ];
}
