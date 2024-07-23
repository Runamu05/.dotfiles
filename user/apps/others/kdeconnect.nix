{ pkgs, ... }:

{
  home.packages = with pkgs; [ kdeconnect ];
}
