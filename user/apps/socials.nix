{ pkgs, ... }:

{
  home.packages = with pkgs; [
    telegram-desktop
    discord
  ];

  #programs.thunderbird = {
  #  enable = true;
    #TODO Add configuration
  #};
}
