{ pkgs, ... }:

{
  users.users.sana = {
    isNormalUser = true;
    createHome = true;
    description = "二葉さな";
    extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" "slskd" ];
    shell = pkgs.fish;

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1Mbo28yG2Oln+KLKYp84MI/4t8ImUBPtEN1sym9OVz0pRGtBAhjaF5DYVpLUm0D7+cyuA4G/yKmjN7AEtvxDsr7t9aZaGII16p1WX5KU+A9o8aldRJPZEqCKTNY/+mYpHOEj9p1L8PE7AymXMlPGhfL1xpwrApaO9gk9eIQkO2mbe9xE8HZKeJ/WPLDhoVI/yOn1Ulof2k2QvvrqHc78e28ieqk5lcmBn1apZe4IMVBfhK9Gtc4Wtmaga1Dya2YP7j5qc0I0vFXERI9Lr2wMHDHRy85nS5qzLFBMSc+OYVW1s0xn2u3XMeldyWcWWrCbOsY/W/V7Ojv0pwEAVfUTCjxEExjerGj9r78LZA9ICy+0j3+hTzn1D+b3LZkKPl1AXq4MI320YAo4M4nHtvpaaUsI/+6g0YBq+zpga8AoESyIyCtouY8nnTBraEcHBmoUK0ly1VBrBKMUB/sGe8xjOMmfxNwHSNEY6CqhGtf3UTXLq7NWuIHkKVmjIYtVbbsc0YWiovVT2hHsfLGVG5JYrTH/+vN7fDVq7VwMQnVQBXtzBmmntwmdSpeWU0w1x8mLWgMiGbLQxDJn2ee3p4C5ub0NPgCXsMbxEbsjC2eeRUMaKcyJS0LuSPkDlzk5Z9P05HkemaPfBNvnV1JwQ9kaT7Otvj7Ynr1OoXFZTgokPHw== cardno:24_483_552"
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
