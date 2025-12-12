{ pkgs, ... }:

{
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
      WorkingDirectory = "/srv/sana/sana-backend";
      EnvironmentFile = "/srv/sana/sana-backend/.env";
      ExecStart = "${pkgs.clojure}/bin/clojure -M:run";
      Restart = "on-failure";
      RestartSec = "10";
    };
  };

  networking.allowedTCPPorts = [ "3000" ];
}

