{ pkgs, ... }:

{
  home.packages = with pkgs; [
    librewolf

    #osu-lazer-bin
    kdePackages.kate

    audacity
    openutau
    #renoise

    libwebcam

    krita
    gimp

    inkscape
    dejavu_fonts
    gnome-themes-extra
    adwaita-icon-theme
    hicolor-icon-theme

    wine
    winetricks
    thcrap-steam-proton-wrapper

    pcsx2
    vintagestoryPackages.latest
    prismlauncher

    pavucontrol
    playerctl
    waybar-mpris
    mupdf

    imv
  ];
}
