{ pkgs, ... }:

{
  users.users.sana = {
    isNormalUser = true;
    createHome = true;
    description = "二葉さな";
    extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" "slskd" ];
    shell = pkgs.fish;

    openssh.authorizedKeys.keys = [
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLd2Cxrph6ES6ClDbqXFDWhI9+N+2+sKI5DMlFOco0XMmX8kHUNEOZengOpzJQ60EcNYYZbBd6mapqAd3Z/bGQg= sana@doppel.moe"
      "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGXE85j6/DEbt7UZS2nRfjNzdPClPwBG/admRewhTYUnr2JeXr+lLOS9tWk/vsgzkwFaxvlUvvRvTWWJwoeZd7DnwE2oy+1GXwFPqUHjDQg/DpQR8eu7U28Do6+moNTqLGW13FrMyv4CraXTcSn40E5PZvuOWyNjhsGSsFHeyt/J9Fgjg== sana@termius"
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKEZQ47LGdCgvTcsOHH89X2CAIMhkoQG+zX8r3D/UPWChwpGLpKuun58yTfVTnO3dxEnZM8eQl+hv/G4FPbFEpo= sana@SATELLITE"
    ];
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -U fish_greeting
      fastfetch
    '';
  };
}
