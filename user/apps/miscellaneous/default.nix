{ pkgs, ... }:

{
  imports = [
    ./spicetify.nix
  ];

  home.packages = with pkgs; [
    gpt4all
    obs-studio
  ];
}
