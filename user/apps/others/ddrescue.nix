{ pkgs, ... }:

{
  home.packages = with pkgs; [ ddrescue ];
}
