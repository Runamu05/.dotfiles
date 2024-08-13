{ pkgs, ... }:

{ 
  #environment.systemPackages = with pkgs; [ corectrl ];
  programs.corectrl.enable = true;
}
