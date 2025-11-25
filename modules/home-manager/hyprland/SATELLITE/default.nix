{ nix-colors, ... }:

{
  imports = [
    ./visuals.nix
    ./waybar.nix
    ./hyprpaper.nix
    nix-colors.homeManagerModules.default
  ];

    colorScheme = {
      slug = "haibane";
      name = "Haibane Dark";
      author = "eightheve";
      palette = {
        base00 = "4b3b40"; # GREY
        base01 = "13070b"; # Black
        base02 = "f89281"; # RED
        base03 = "cb786a"; # Maroon
        base04 = "7ebd71"; # LIME
        base05 = "679b5c"; # Green
        base06 = "d8a545"; # YELLOW
        base07 = "b2883a"; # Olive
        base08 = "a1a6ff"; # BLUE
        base09 = "8489d1"; # Navy
        base0A = "e892cc"; # FUCHSIA
        base0B = "bf78a8"; # Purple
        base0C = "51bbc0"; # AQUA
        base0D = "029da4"; # Teal
        base0E = "f0f2f1"; # WHITE (was f3f3f3)
        base0F = "c3c4c3"; # Silver (was a3a3a3)
      };
    };
    #${config.colorScheme.palette.base0X}

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # MONITORS #
      monitor = [
        "eDP-1, 1920x1080, 0x0, 1"
      ];

      # WINDOWS AND WORKSPACES #
      windowrule = [
        "suppressevent maximize, class:.*"
        "float, class:^(org.pulseaudio.pavucontrol)$"
        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      windowrulev2 = [
        "monitor DP-2, class:^(steam_app_374320)$"
        "workspace 3, class:^(steam_app_374320)$"
        #"tile, class:^(steam_app_374320)$"
        "fullscreen, class:^(steam_app_374320)$"

        "size 768 256, class:^(imv)$, title:.*colemak-layout\.png.*"
        "float, class:^(imv)$, title:.*colemak-layout\.png.*"
        "opacity 0.4, class:^(imv)$, title:.*colemak-layout\.png.*"
        "noblur, class:^(imv)$, title:.*colemak-layout\.png.*"
      ];
    };
  };
}
