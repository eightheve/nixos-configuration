{ config, pkgs, ... }:

{
  programs.ssh.extraConfig = ''
    Host HAMUKO-NIXREMOTE
      HostName 192.168.1.20
      IdentitiesOnly yes
      IdentityFile /root/.ssh/nixremote
      User nixremote

    Host NYANKO-NIXREMOTE
      HostName 192.168.1.30
      IdentitiesOnly yes
      IdentityFile /root/.ssh/nixremote
      User nixremote

    Host HIME-NIXREMOTE
      HostName 192.168.1.40
      IdentitiesOnly yes
      IdentityFile /root/.ssh/nixremote
      User nixremote
  '';

  nix = {
    buildMachines = [
      {
        hostName = "HAMUKO-NIXREMOTE";
        system = "x86_64-linux";
        protocol = "ssh-ng";
        maxJobs = 4;
        speedFactor = 2;
        supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      }
      {
        hostName = "NYANKO-NIXREMOTE";
        system = "x86_64-linux";
        protocol = "ssh-ng";
        maxJobs = 4;
        speedFactor = 2;
        supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      }
      {
        hostName = "HIME-NIXREMOTE";
        system = "x86_64-linux";
        protocol = "ssh-ng";
        maxJobs = 4;
        speedFactor = 2;
        supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      }
    ];
    distributedBuilds = true;
    extraOptions = ''
      builders-use-substitutes = true
    '';
  };
}
