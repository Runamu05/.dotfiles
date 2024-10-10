{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # JDK 22 and Intellij
    jdk22
    jetbrains.idea-community-bin
    # Nixvim
    inputs.nixvim.packages."x86_64-linux".default
    # Cosmic Editor
    cosmic-edit
    # Obsidian
    obsidian
    # GIMP (photo editor)
    gimp
  ];
}
