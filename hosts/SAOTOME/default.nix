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

    networkmanager.enable = true;
    interfaces.eno3 = {
      ipv4.addresses = [ {
        address = "192.168.1.10";
        prefixLength = 24;
      } ];
      useDHCP = false;
    };
  };

  boot.swraid = {
    enable = true;
    mdadmConf = ''
      MAILADDR root
      ARRAY /dev/md0 level=5 num-devices=15 metadata=1.2 UUID=c1aaf920:0dc7a83f:2f77a095:7f43bfb0 devices=/dev/disk/by-id/wwn-0x5000c500958dac3f,/dev/disk/by-id/wwn-0x5000c500958dd1eb,/dev/disk/by-id/wwn-0x5000c500958ee307,/dev/disk/by-id/wwn-0x5000c500958f73e3,/dev/disk/by-id/wwn-0x5000c5009614bcfb,/dev/disk/by-id/wwn-0x5000c500965407d7,/dev/disk/by-id/wwn-0x5000c5009655c9a3,/dev/disk/by-id/wwn-0x5000c50096601f2f,/dev/disk/by-id/wwn-0x5000c50096603f77,/dev/disk/by-id/wwn-0x5000c50096637acf,/dev/disk/by-id/wwn-0x5000c500966cebe7,/dev/disk/by-id/wwn-0x5000c500967e301b,/dev/disk/by-id/wwn-0x5000c50096bbb1f7,/dev/disk/by-id/wwn-0x5000c50096cedc0b,/dev/disk/by-id/wwn-0x5000c50096d886cf
    '';
  };

  fileSystems."/srv/raid" = {
    device = "/dev/md0";
    fsType = "ext4";
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
