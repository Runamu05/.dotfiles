{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # JDK 22 and Intellij
    jdk22
    jetbrains.idea-community-bin
    # Nixvim
    inputs.nixvim.packages."x86_64-linux".default
    # Obsidian
    obsidian 
  ];
}
