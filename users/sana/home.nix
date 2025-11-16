{ pkgs, ... }:

{
  home = {
    username = "sana";
    homeDirectory = "/home/sana";
  };

  programs = {
    git = {
      enable = true;
      userName = "doppelsana";
      userEmail = "sana@doppel.moe";
    };
    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
    };
  };

  home.packages = with pkgs; [
    home-manager

    unar
    xar
    file
    xxd
    python3
    python-qt

    flavours
    ffmpeg-full
  ];

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.05";
}
