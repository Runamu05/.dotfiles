{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ btop ];
  nixpkgs.config.rocmSupport=true;
}
