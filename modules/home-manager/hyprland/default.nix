{ pkgs, ... }:

{
  imports = [
    ./configuration/binds.nix
    ./configuration/visuals.nix

    ./gtk-theme.nix
    ./hyprpaper.nix
    ./mako.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    hyprpaper
    slurp
    grim
    wl-clipboard
  ];

  programs.wofi = {
    enable = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    size = 24;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # MONITORS #
      monitor = [
        "DP-1, disable"
        "HDMI-A-1, 1920x1200, 0x0, 1, transform, 1"
        "DP-2, 1920x1200, 1200x80, 1"
      ];

      # MY PROGRAMS #
      # See https://wiki.hypr.land/Configuring/Keywords/
      # Set programs that you use
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";

      # AUTOSTART #
      # Autostart necessary processes (like notifications daemons, status bars, etc.)
      # Or execute your favorite apps at launch like this:
      exec-once = [
        "hyprpaper &"
        "waybar &"
        "mako &"
        "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1 &"
      ];

      # ENVIRONMENT VARIABLES #
      # See https://wiki.hypr.land/Configuring/Environment-variables/
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];
      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      # See https://wiki.hypr.land/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };

      # https://wiki.hypr.land/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
      };

      # INPUT #
      # https://wiki.hypr.land/Configuring/Variables/#input
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      cursor = {
        sync_gsettings_theme = true;
        hide_on_touch = false;
        hide_on_key_press = false;
        inactive_timeout = 30;
        no_hardware_cursors = 1;
      };

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
      ];
    };
  };
}
