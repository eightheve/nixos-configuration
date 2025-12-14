{ pkgs, ... }:

{
  services.nginx = {
    enable = true;
    virtualHosts."api.doppel.moe" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://localhost:3000/";
        proxyWebsockets = true;
        extraConfig = ''
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
          
          add_header 'Access-Control-Allow-Origin' 'https://sana.doppel.moe' always;
          add_header 'Access-Control-Allow-Methods' 'GET, OPTIONS' always;
          add_header 'Access-Control-Allow-Headers' 'Content-Type' always;
        '';
      };
    };
  };

  environment.systemPackages = [
    pkgs.clojure
  ];

  systemd.services.sana-backend = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    description = "Backend for sana.doppel.moe";

    serviceConfig = {
      Type = "simple";
      User = "sana";
      WorkingDirectory = "/srv/sana/backend";
      EnvironmentFile = "/srv/sana/backend/.env";
      ExecStart = "${pkgs.clojure}/bin/clojure -M:run";
      Restart = "on-failure";
      RestartSec = "10";
    };
  };

  networking.firewall.allowedTCPPorts = [ "3000" ];
}

