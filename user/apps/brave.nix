{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "gcbommkclmclpchllfjekcdonpmejbdp"; } # HTTPS Everywhere
      { id = "acpcapnaopbhbelhmbbmppghilclpkep"; } # Find any font
      { id = "nbhcbdghjpllgmfilhnhkllmkecfmpld"; } # Inject User JavaScript and CSS
      { id = "lggdbpblkekjjbobadliahffoaobaknh"; } # Tango: create guides using screenshots
      { id = "dejmgcinmidgfjbnfkeeopfmfmcggdhj"; } # Study with flashcards
      { id = "oedkbkpngfmjfbmmmijkogojlcddmcgf"; } # Bro-mon: catch monsters
      { id = "hplbpdkajdhlggncdpdmnkjldopmoomg"; } # DevBytes: news and coding extension
      { id = "gebbhagfogifgggkldgodflihgfeippi"; } # YouTube dislike button
      { id = "iaakgomiepekffchlipoegcgahfcdbad"; } # Amazon EU price tracker
      { id = "neebplgakaahbhdphmkckjjcegoiijjo"; } # Keepa: Amazon price tracker
    ];
  };
}
