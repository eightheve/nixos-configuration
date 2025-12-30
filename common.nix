{ pkgs, lib, ... }:

{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  users.users = {
    root.hashedPassword = "!"; # Disable root login
  };

  security.sudo.wheelNeedsPassword = false;

  networking.networkmanager.enable = lib.mkDefault true;
  networking.firewall.allowedTCPPorts = [ 22 2222 ];

  networking.firewall = {
    allowedUDPPortRanges = [ {
      from = 40000;
      to = 50000;
    } ];
    allowedTCPPortRanges = [ {
      from = 40000;
      to = 50000;
    } ];
  };

  security.pam.yubico = {
    enable = true;
    debug = true;
    mode = "challenge-response";
    id = [ "24483552" ];
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  services = {
    pcscd.enable = true;
    udisks2.enable = true;
    postfix = {
      enable = true;
      rootAlias = "sana";
      setSendmail = true;
    };
    openssh = {
      enable = true;
      ports = [ 22 2222 ];
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
    udev.extraRules = ''
      ACTION=="remove",\
        ENV{ID_BUS}=="usb",\
        ENV{ID_MODEL_ID}=="0407",\
        ENV{ID_VENDOR_ID}=="1050",\
        ENV{ID_VENDOR}=="Yubico",\
        RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
    '';
    udev.packages = [ pkgs.yubikey-personalization ];
  };

  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" "ja_JP.UTF-8/UTF-8" ];
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  environment.systemPackages = with pkgs; [
    yubioath-flutter
    yubikey-personalization
    yubico-piv-tool
    yubikey-manager

    tmux

    cryptsetup
    mailutils
    fastfetch
    btop
    wget
    curl
    git
    nnn
  ];
}
