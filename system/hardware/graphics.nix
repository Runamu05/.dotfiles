{ pkgs, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [ pkgs.amdvlk ];
      extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
    };
    #amdgpu.amdvlk = {
    # enable = true;
    # support32Bit = "pkgs.driversi686Linux.amdvlk";
    # supportExperimental = true;
    #};
  };

  services.xserver.videoDrivers = ["amdgpu"];
}
