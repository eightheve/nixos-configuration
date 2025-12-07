{ pkgs, lib, ... }:

{
  imports = [
    ./hardware.nix
  ];

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
  };

  boot.initrd.kernelModules = [ "ideapad_laptop" ];

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
    fprintd = {
      enable = true;
    };
  };

  programs = {
    nix-ld.enable = true;
    steam.enable = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-unwrapped"
  ];

  hardware = {
    graphics.enable = true;
    bluetooth.enable = true;
    sensor.iio.enable = true;

    trackpoint = {
      enable = true;
      emulateWheel = true;
    };
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
