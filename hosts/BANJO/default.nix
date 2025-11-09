{
  imports = [
    ./hardware.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "BANJO";

    networkmanager.enable = true;
    interfaces.enp1s0f0 = {
      ipv4.addresses = [ {
        address = "192.168.1.2";
        prefixLength = 24;
      } ];
      useDHCP = false;
    };
  };

  services.openssh.enable = true;
  networking.firewall.enable = false;

  system.stateVersion = "25.05"; # Did you read the comment?
}
