{ lib, ... }:

{
  users.users.slskd = {
    isSystemUser = true;
    group = "slskd";
    home = "/var/lib/slskd";
    createHome = true;
    homeMode = "774";
  };

  networking.firewall.allowedTCPPorts = [ 5030 5031 50300 80 443 ];
  networking.firewall.allowedUDPPorts = [ 50300 ];

  services.nginx = {
    enable = true;
    virtualHosts."slskd.home.doppel.moe" = {
      locations."/" = {
        proxyPass = "http://127.0.0.1:5030";
        proxyWebsockets = true;
      };
    };
  };

  services.slskd = {
    enable = true;
    
    domain = "slskd.home.doppel.moe";
    openFirewall = true;
    
    environmentFile = "/var/lib/slskd/.env";
    group = "slskd";
    user = "slskd";

    settings = {
      directories = {
        incomplete = "/var/lib/slskd/incomplete";
        downloads = "/var/lib/slskd/downloads";
      };
      shares = {
        directories = [ "[RAID]/srv/data/music" "[ARCHIVE]/srv/data/old-music/" ];
        cache = {
          storage_mode = "memory";
          workers = 12;
          retention = 1440;
        };
      };

      global = {
        upload = {
          slots = 10;
          speed_limit = 10000;
        };
        download = {
          slots = 500;
          speed_limit = 10000;
        };
      };
      groups = {
        default = {
          upload = {
            priority = 500;
            strategy = "roundrobin";
            slots = 10;
          };
        };
        leechers = {
          upload = {
            priority = 999;
            strategy = "roundrobin";
            slots = 1;
            speed_limit = 100;
          };
        };
        user_defined = {
          buddies = {
            upload = {
              priority = 250;
              queue_strategy = "firstinfirstout";
              slots = 20;
            };
            members = [ "ZippyZappy" "hi im casper" "kevinshieldsfunnymoments" ];
          };
        };
      };

      soulseek = {
        distributed_network = {
          child_limit = 100;
        };
        description = ''
          puppy thing located in us-east
          metadata is managed by beets, please message me if i have bad metadata or missing tracks. running off a large server, so don't feel bad about leeching.
          you can also message me if you have music recommendations. i love emo and math rock
        '';
        picture = "/var/lib/slskd/profile-picture.jpg";
      };

      web = {
        https = {
          disabled = false;
          port = 5031;
        };
      };
    }; 
  };
}
