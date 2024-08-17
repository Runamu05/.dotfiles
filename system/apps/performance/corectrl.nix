{ pkgs, ... }:

{ 
  programs.corectrl = {
    enable = true;
    gpuOverclock.enable = true;
  };

  users.users.runamu.extraGroups = [ "corectrl" ];

  environment.systemPackages = [ pkgs.lm_sensors ];
}
