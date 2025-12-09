{ lib, config, ... }:

let
  users = lib.filterAttrs (_: u: u.isNormalUser or false) config.user.users;
in {
  security.acme = {
    acceptTerms = true;
    defaults.email = "sana@doppel.moe";
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
      virtualHosts = lib.mapAttrs' (name: _: {
        inherit name;
        value = {
          serverName = "${name}.doppel.moe";
          root = "/srv/${name}/www";
          forceSSL = true;
          enableACME = true;
        };
    }) users;
  };

  system.activationScripts.userWebDirs.text = ''
    ${lib.concatStringsSep "\n" (
      lib.mapAttrsToList (name: _: ''
        mkdir -p /srv/${name}/www
        chown ${name}:users /srv/${name}
        chown ${name}:users /srv/${name}/www
        chmod 755 /srv/${name}
        chmod 755 /srv/${name}/www
      '') users
    )}
  '';
}
