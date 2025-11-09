{ pkgs, ... }:

{
  users.users.sana = {
    isNormalUser = true;
    createHome = true;
    description = "二葉さな";
    extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
    shell = pkgs.fish;

    openssh.authorizedKeys.keys = [
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLd2Cxrph6ES6ClDbqXFDWhI9+N+2+sKI5DMlFOco0XMmX8kHUNEOZengOpzJQ60EcNYYZbBd6mapqAd3Z/bGQg= sana@doppel.moe"
      "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGXE85j6/DEbt7UZS2nRfjNzdPClPwBG/admRewhTYUnr2JeXr+lLOS9tWk/vsgzkwFaxvlUvvRvTWWJwoeZd7DnwE2oy+1GXwFPqUHjDQg/DpQR8eu7U28Do6+moNTqLGW13FrMyv4CraXTcSn40E5PZvuOWyNjhsGSsFHeyt/J9Fgjg== sana@termius"
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCg8sf3f7xD4Qbrw4aq6y7yLYZLJlSFFtFzrBwnaMDQvK9xxb/Z1R6ihoeuwOHUL0FXshOAE2LyzNzsWlFCwEo8= sana@BANJO"
    ];
  };

  programs.fish.enable = true;
}
