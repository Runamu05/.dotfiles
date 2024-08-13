{ userSettings, ... }:

{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # ensure pulseaudio disabled
  hardware.pulseaudio.enable = false;

  users.users."runamu" = {
    extraGroups = [ "audio jackaudio" ];
  };

}

