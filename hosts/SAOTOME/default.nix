{ ... }:

{
  imports = [
    ./hardware.nix
  ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/disk/by-id/wwn-0x50000000000029e4";
  };

  networking = {
    hostName = "SAOTOME";
    networkmanager.enable = false;

    interfaces.eno3 = {
      useDHCP = false;
      ipv4.addresses = [ {
        address = "192.168.1.10";
        prefixLength = 24;
      } ];
    };

    defaultGateway = "192.168.1.1";
    nameservers = [ "8.8.8.8" "1.1.1.1" ];
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.swraid = {
    enable = true;
    mdadmConf = ''
      MAILADDR root
      DEVICE /dev/disk/by-id/wwn-0x5000c*
      ARRAY /dev/md0 level=5 num-devices=15 metadata=1.2 UUID=3486501f:98659bf6:1ed0661e:d875767d
    '';
  };

  fileSystems."/srv/data" = {
    device = "/dev/md0";
    fsType = "ext4";
  };

  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;
  networking.firewall.enable = false;

  system.stateVersion = "25.05"; # Did you read the comment?
}
