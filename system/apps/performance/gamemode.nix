{ ... }:

{
  users.users.runamu.extraGroups = [ "gamemode" ];

  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {

      general = {
        renice = 10;
        desiredgov = "performance";
        igpu_desiredgov = "performance";
        igpu_power_threshold = -1;
        softrealtime = "auto";
        ioprio = 0;
      };

      cpu = {
        park_cores = false;
        #pin_cores = true;
      };

      gpu = {
        gpu_device = 0;
        amd_performance_level = "high";
      };
    };
  };
}
