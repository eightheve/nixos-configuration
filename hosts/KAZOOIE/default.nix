{
  imports = [
    ./hardware.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking = {
    hostName = "KAZOOIE";
    firewall = {
      allowedUDPPorts = [ 51820 ];
    };
  };

  system.stateVersion = "25.05";
}
