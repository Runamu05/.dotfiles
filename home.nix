{ pkgs, ... }:

{
 imports = [
   ./git/git.nix
 ];

 nixpkgs.config = {
   allowUnfree = true;
   allowUnfreePredicate = (_ : true);
 };

 home.username = "runamu";
 home.homeDirectory = "/home/runamu";

 home.stateVersion = "24.05";

 home.packages = with pkgs; [];

 programs.home-manager.enable = true;
}
