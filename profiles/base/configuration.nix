# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware 
      ../../system/hardware-configuration.nix
      ../../system/hardware
      ../../system/wm/hyprland.nix
      ../../system/fonts/fonts.nix
    #  ../../system/apps/games
      ../../system/apps/performance
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = with config.boot.kernelPackages; [
    ryzen-smu
    cpupower
  ];

  networking.hostName = "runapc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable tlp (saves battery life)
  #services.tlp.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "it_IT.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the sddm Display Manager.
  services.displayManager.sddm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable AMD rocm support
  nixpkgs.config.rocmSupport = true;

  # Manage CPU, GPU governor and fan speed
  hardware.cpu.amd.ryzen-smu.enable = true;
  hardware.cpu.amd.updateMicrocode = true;

  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_zen.ryzen-smu
    linuxKernel.packages.linux_zen.cpupower
    msr-tools
    ( ryzenadj.overrideAttrs {
      buildPhase = ''
        cmake -DCMAKE_BUILD_TYPE=Debug .
        make
      '';
    } )
    acpidump-all
    lact
  ];

  systemd.services.lact = {
    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };

  # Default Shell
  users.defaultUserShell = pkgs.nushell;

  # Support NTFS file system
  boot.supportedFilesystems = [ "ntfs" ];
  #fileSystems."/path/to/mount" = {
  #  device = "/path/to/device";
  #  fsType = "ntfs-3g";
  #  options = [ "nofail" "rw" "uid = runamu" ];
  #};

  # Storage optimization
  nix.settings.auto-optimise-store = true;
  #nix.gc = {
  #  automatic = true;
  #  dates = "daily";
  #  options = "--delete-old";
  #};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.runamu = {
    isNormalUser = true;
    description = "Runamu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      neovim
      git
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
 
  system.stateVersion = "24.11";

  nix.settings.experimental-features = ["nix-command" "flakes" ];
}
