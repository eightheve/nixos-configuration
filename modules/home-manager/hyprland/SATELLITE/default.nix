{ nix-colors, pkgs, ... }:

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

  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          timeout = 300; # 5 minutes
          on-timeout = "${pkgs.hyprlock}/bin/hyprlock";
        }
      ];
      general = {
        lock_cmd = "${pkgs.hyprlock}/bin/hyprlock";
      };
    };
  };

  fonts.fontconfig.enable = true;
  home.packages = [ pkgs.libre-baskerville pkgs.imagemagick pkgs.ffmpeg-full ];

  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        path = "~/.assets/lock.jpg";
        brightness = 0.2;
      };
      image = [
        {
          reload_cmd = ''~/.config/hypr/scripts/get-text-bounder.sh "$(~/.config/hypr/scripts/nowplaying-title.sh)" 48'';
          reload_time = 1;
          size = 96;
          rounding = 0;
          border_size = 0;
          position = "55, 93";
          halign = "left";
          valign = "bottom";
        }
        {
          reload_cmd = ''~/.config/hypr/scripts/get-text-bounder.sh "$(~/.config/hypr/scripts/nowplaying-artist.sh)" 38'';
          reload_time = 1;
          size = 76;
          rounding = 0;
          border_size = 0;
          position = "55, 35";
          halign = "left";
          valign = "bottom";
        }
      ];
      label = [
        {
          text = "Locked";
          color = "rgba(38, 28, 23, 1.0)";
          font_size = 48;
          font_family = "Libre Baskerville";
          position = "-65, -45";
          halign = "right";
          valign = "top";
        }
#        {
#          text = "cmd[update:1000] ~/.config/hypr/scripts/nowplaying-title.sh";
#          color = "rgba(238, 228, 211, 1.0)";
#          font_size = 48;
#          font_family = "Libre Baskerville";
#          position = "65, 103";
#          halign = "left";
#          valign = "bottom";
#        }
#        {
#          text = "cmd[update:1000] ~/.config/hypr/scripts/nowplaying-artist.sh";
#          color = "rgba(238, 228, 211, 1.0)";
#          font_size = 38;
#          font_family = "Libre Baskerville";
#          position = "65, 45";
#          halign = "left";
#          valign = "bottom";
#       }
      ];
    };
  };
      
  home.file.".config/hypr/scripts/nowplaying-title.sh" = {
    text = ''
      #!/usr/bin/env bash
      ${pkgs.playerctl}/bin/playerctl metadata title 2>/dev/null
    '';
    executable = true;
  };

  home.file.".config/hypr/scripts/nowplaying-artist.sh" = {
    text = ''
      #!/usr/bin/env bash
      artist=$(${pkgs.playerctl}/bin/playerctl metadata artist 2>/dev/null)
      if [[ -n "$artist" ]]; then
          echo "- $artist"
      fi
    '';
    executable = true;
  };

  home.file.".config/hypr/scripts/get-text-bounder.sh" = {
    text = ''
      #!/usr/bin/env bash
      
      if [ "$#" -ne 2 ]; then
          echo "Usage: $0 <text> <font_size>"
          exit 1
      fi
      
      TEXT="$1"
      FONT_SIZE="$2"
      FONT_FILE="${pkgs.libre-baskerville}/share/fonts/truetype/LibreBaskerville-Regular.ttf"
      OUTPUT_DIR="/tmp/text-labels"
      
      mkdir -p "$OUTPUT_DIR"
      
      SAFE_TEXT=$(echo "$TEXT" | tr ' /' '_' | tr -cd '[:alnum:]_-')
      OUTPUT_FILE="$OUTPUT_DIR/''${SAFE_TEXT}-''${FONT_SIZE}.png"
      
      WIDTH=$(${pkgs.imagemagick}/bin/magick -font "$FONT_FILE" -pointsize "$FONT_SIZE" label:"$TEXT" -format "%w" info:)
      HEIGHT=$(${pkgs.imagemagick}/bin/magick -font "$FONT_FILE" -pointsize "$FONT_SIZE" label:"$TEXT" -format "%h" info:)
      
      ${pkgs.ffmpeg}/bin/ffmpeg -f lavfi -i "color=c=black@0.0:size=$((4 + ''${WIDTH}))x$((4 + ''${HEIGHT})),format=rgba" \
          -vf "drawtext=fontfile='$FONT_FILE':text='$TEXT':fontsize=$FONT_SIZE:fontcolor=white:x=4:y=4:borderw=2:bordercolor=#261c17" \
          -frames:v 1 -pix_fmt rgba -y "$OUTPUT_FILE" 2>/dev/null
      
      echo "$OUTPUT_FILE"
    '';
    executable = true;
  };

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
