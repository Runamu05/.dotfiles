{ pkgs, inputs, lib, ... }:

{
imports = [
  inputs.spicetify-nix.homeManagerModules.default
];

programs.spicetify =
   let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
   in
   {
     enable = true;

     #enabledCustomApps = with spicePkgs.apps; [
      # new-releases
       #lyrics-plus
       #{
        #  name = "spicetifyDependencies";
         # src = spicetifyDependencies;
          #appendName = true;
        #}
     #];

     enabledExtensions = with spicePkgs.extensions; [
       adblock
       hidePodcasts
       fullAppDisplay
       loopyLoop
       playlistIntersection
       playlistIcons
       seekSong
       powerBar
       listPlaylistsWithSong
       savePlaylists
       popupLyrics
       volumePercentage
       history
       shuffle # shuffle+ (special characters are sanitized out of extension names)
     ];

     theme = spicePkgs.themes.burntSienna;
          
     # specify that we want to use our custom colorscheme
     colorScheme = "custom";

     # color definition for custom color scheme. (rosepine)
     customColorScheme = {
       text = "ffa100";
       subtext = "F0F0F0";
       sidebar-text = "ffa100";
       highlight = "202020";
       main = "232323";
       main-elevated = "202020";
       background = "171717";
       sidebar = "171717";
       player = "232323";
       card = "232323";
       shadow = "1f1d2e";
       selected-row = "ffa100";
       button = "ff8b00";
       button-active = "f45236";
       button-disabled = "202020";
       tab-active = "ff8b00";
       notification = "202020";
       notification-error = "eb6f92";
       misc = "3a3a3a";
     };
   };
}
