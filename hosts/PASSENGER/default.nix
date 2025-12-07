{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
  ];

  boot.kernelModules = [ "xpad" ];
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];


  networking = {
    hostName = "PASSENGER";
    defaultGateway = "192.168.1.1";
    nameservers = [ "192.168.1.10" ];
    interfaces.enp12s0 = {
      ipv4.addresses = [ {
        address = "192.168.1.3";
        prefixLength = 24;
      } ];
      useDHCP = false;
    };
    firewall.allowedUDPPorts = [ 27036 ];
  };

  nixpkgs.config.allowUnfree = true;

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };
    printing.enable = true;
  };

  programs = {
    nix-ld.enable = true;
    steam = {
      enable = true;
      protontricks.enable = true;
    };
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      open = false;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
    bluetooth.enable = true;
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
    libGL
    pciutils
    gwe
    lm_sensors
    pulseaudio
    ];

  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # BE CAREFUL!
  system.stateVersion = "25.05";
}
