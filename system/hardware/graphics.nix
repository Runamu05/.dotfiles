{ pkgs, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [ 
        rocmPackages.clr.icd
      #  pkgs.amdvlk
      ];
      extraPackages32 = [ 
      #  pkgs.driversi686Linux.amdvlk
      ];
    };
    amdgpu = {
      #initrd.enable = true;
      #opencl.enable = true;
      #amdvlk = {
      #  enable = true;
      #  support32Bit.enable = true;
      #  supportExperimental.enable = true;
      #};
    };
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
