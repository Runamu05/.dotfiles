{ ... }:

{
  users.users.runamu.extraGroups = [ "gamemode" ];

  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {

      general = {
        renice = -5;
        desiredgov = "performance";
        igpu_desiredgov = "ondemand";
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
