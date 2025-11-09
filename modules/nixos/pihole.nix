{ ... }:

{
  virtualisation.containers = {
    enable = true;

    policy = {
      default = [ { type = "insecureAcceptAnything"; } ];
      transports = {
        docker-daemon = {
          "" = [ { type = "insecureAcceptAnything"; } ];
        };
      };
    };
  };

  users.users.pihole = {
    description = "System user for pihole systemd unit";
    isSystemUser = true;
    group = "pihole";
    createHome = true;
    home = "/var/lib/pihole";
    subGidRanges = [ {
      count = 65536;
      startGid = 200000;
    } ];
    subUidRanges = [ {
      count = 65536;
      startUid = 200000;
    } ];
  };

  users.groups.pihole = {};

  boot.tmp.cleanOnBoot = true;
  services.pihole = {
    enable = true;
    hostConfig = {
      user = "pihole";
      enableLingeringForUser = true;

      persistVolumes = true;

      dnsPort = 53;
      webPort = 8080;
    };
    piholeConfig = {
      ftl.LOCAL_IPV4 = "192.168.1.10";
      interface = "eno3";
      web = {
        virtualHost = "pi.hole";
        password = "password";
      };
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ 53 8080 ];
    allowedUDPPorts = [ 53 ];
  };

  services.resolved.enable = false;

  boot.kernel.sysctl = {
    "net.ipv4.ip_unprivileged_port_start" = 53;
  };
}
