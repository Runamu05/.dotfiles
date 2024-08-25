{ ... }:

{
  programs.mangohud = {
    enable = true;
    settings = {
      preset = 4;
    };
  };

  home.sessionVariables = {
    "MANGOHUD_CONFIGFILE" = "$HOME/.config/MangoHud/MangoHud.conf";
  };  
}
