{ pkgs, ... }:

{
  home.packages = with pkgs; [ gpt4all ];
}
