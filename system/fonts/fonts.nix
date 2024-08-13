{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    minecraftia
  ];
}
