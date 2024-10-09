{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ android-file-transfer ];
}
