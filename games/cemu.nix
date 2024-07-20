{ pkgs, ... }:

{
environment.systemPackages =  with pkgs; [
  cemu
  ];
}
