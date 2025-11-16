{ nix-colors, ... }:

{
  imports = [
    ./visuals.nix
    ./waybar.nix
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

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # MONITORS #
      monitor = [
        "DP-1, disable"
        "HDMI-A-1, 1920x1200, 0x0, 1, transform, 1"
        "DP-2, 1920x1200, 1200x80, 1"
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
