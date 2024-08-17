{ pkgs, ... }:

{
  home.packages = with pkgs; [ 
    jdk22
    jetbrains.idea-community-bin
  ];
}
