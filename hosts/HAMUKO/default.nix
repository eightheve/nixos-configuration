{ ... }:

{
  imports = [
    ./hardware.nix
  ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/disk/by-id/wwn-0x55cd2e404b4d9a19";
  };

  networking = {
    hostName = "HAMUKO";
    networkmanager.enable = false;

    interfaces.eno1 = {
      useDHCP = false;
      ipv4.addresses = [ {
        address = "192.168.1.20";
        prefixLength = 24;
      } ];
    };

    defaultGateway = "192.168.1.1";
    nameservers = [ "8.8.8.8" "1.1.1.1" ];
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;
  networking.firewall.enable = false;

  system.stateVersion = "25.05"; # Did you read the comment?
}
