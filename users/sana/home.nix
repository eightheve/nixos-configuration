{ nix-colors, pkgs, ... }:

{
  imports = [
    nix-colors.homeManagerModules.default
  ];

  colorScheme = {
    slug = "madoka";
    name = "Madoka Dark";
    author = "eightheve";
    palette = {
      base00 = "424852"; # GREY
      base01 = "070b13"; # Black
      base02 = "e03742"; # RED
      base03 = "a62730"; # Maroon
      base04 = "3fb68f"; # LIME
      base05 = "027c5c"; # Green
      base06 = "eba254"; # YELLOW
      base07 = "ae783e"; # Olive
      base08 = "936db5"; # BLUE
      base09 = "744c80"; # Navy
      base0A = "f34467"; # FUCHSIA
      base0B = "b4304b"; # Purple
      base0C = "5b9ae8"; # AQUA
      base0D = "5e69ac"; # Teal
      base0E = "e3e3e3"; # WHITE (was f3f3f3)
      base0F = "a3a3a3"; # Silver (was a3a3a3)
    };
  };
  #${config.colorScheme.palette.base0X}

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
