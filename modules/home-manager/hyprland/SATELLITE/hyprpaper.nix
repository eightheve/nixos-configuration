{ ... }:

{
  services.hyprpaper.enable = true;
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload=~/.assets/wallpaper.jpg
    wallpaper=eDP-1,~/.assets/wallpaper.jpg
  '';
}
