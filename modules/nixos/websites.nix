{ lib, ... }:
let
  webUsers = [ "sana" ];
in
{
  services.nginx.virtualHosts = builtins.listToAttrs (
    builtins.map
      (name: {
        name = "${name}.doppel.moe";
        value = {
          serverName = "${name}.doppel.moe";
          root = "/srv/${name}/www";
          forceSSL = true;
          enableACME = true;
          locations."/" = {
            index = "index.html INDEX.html";
            tryFiles = "$uri $uri/ /404.html =404";
          };
        };
      })
      webUsers
  );

  system.activationScripts = builtins.listToAttrs (
    builtins.map
      (name: {
        name = "setup-${name}-www";
        value = lib.stringAfter [ "users" ] ''
          mkdir -p /srv/${name}/www
          chown ${name}:users /srv/${name}
          chown ${name}:users /srv/${name}/www
          chmod 755 /srv/${name}
          chmod 755 /srv/${name}/www
        '';
      })
      webUsers
  );
}
