{ config, pkgs, ... }:

{
  users.users.nixremote = {
    isNormalUser = true;
    home = "/home/nixremote";
    createHome = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAThaVtAb1QhxVxYuORHd71O58Y5bLOLdkUr8A9N4yIl root@SAOTOME"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICkb4O78MsBxBrHc/VFtDcO35/G26kYiRWVYBbN/f5Iz root@PASSENGER"
    ];
  };

  # Lock down the home directory
  systemd.tmpfiles.rules = [
    "z /home/nixremote 0555 nixremote nixremote -"
    "z /home/nixremote/.ssh 0555 nixremote nixremote -"
  ];

  nix.settings.trusted-users = [ "nixremote" ];
}
