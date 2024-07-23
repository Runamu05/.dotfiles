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

     enabledCustomApps = with spicePkgs.apps; [
       new-releases
       lyrics-plus
       {
          name = "spicetifyDependencies";
          src = spicetifyDependencies;
          appendName = true;
        }
     ];

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
     theme = spicePkgs.themes.retroBlur;
     colorScheme = "mocha";
   };
}
