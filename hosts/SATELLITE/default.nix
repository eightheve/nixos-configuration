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

  networking.hostName = "SATELLITE";

  services = {
    xserver = {
      enable = true;
    };
    printing.enable = true;
  };

  programs = {
    nix-ld.enable = true;
  };

  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
    libGL
    pciutils
    lm_sensors
    pulseaudio
    fastfetch
  ];

  # BE CAREFUL!
  system.stateVersion = "25.05";
}
