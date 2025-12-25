{ pkgs, ... }:

{
  home = {
    username = "cyanobacteria";
    homeDirectory = "/home/cyanobacteria";
  };

  programs = {
    git = {
      enable = true;
      userName = "cyanobacteria";
      userEmail = "sarah_yan@brown.edu";
    };
  };

  home.packages = with pkgs; [
    home-manager

    unar
    xar
    file
    xxd
  ];

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.05";
}
