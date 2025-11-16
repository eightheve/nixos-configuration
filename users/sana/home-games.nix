{ pkgs, ... }:

{
  home.packages = with pkgs; [
    thcrap-steam-proton-wrapper

    pcsx2
    vintagestoryPackages.latest
    prismlauncher
    ckan
  ];
}
