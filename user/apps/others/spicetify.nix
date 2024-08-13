{ pkgs, inputs, lib, ... }:

{
imports = [
  inputs.spicetify-nix.homeManagerModules.default
];

programs.spicetify =
   let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};

     officialThemesOLD = pkgs.fetchgit {
       url = "https://github.com/spicetify/spicetify-themes";
       rev = "c2751b48ff9693867193fe65695a585e3c2e2133";
       sha256 = "0rbqaxvyfz2vvv3iqik5rpsa3aics5a7232167rmyvv54m475agk";
     };
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
       #fullAppDisplay
       fullScreen
       loopyLoop
       playlistIntersection
       playlistIcons
       trashbin
       showQueueDuration
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
       extratext = "F0F0F0";
       sidebar-text = "ffa100";
       highlight = "202020";
       highlight-elevated = "febb5e";
       main = "232323";
       main-elevated = "202020";
       background = "171717";
       sidebar = "171717";
       player = "202020";
       card = "202020";
       shadow = "171717";
       selected-row = "ffa100";
       button = "ff8b00";
       button-active = "ff5e00";
       button-disabled = "202020";
       tab-active = "ff8b00";
       notification = "202020";
       notification-error = "ffa100";
       misc = "3a3a3a";
     };
   };
}
