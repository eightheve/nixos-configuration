{ pkgs, ... }:

{
  users.users.cyanobacteria = {
    isNormalUser = true;
    createHome = true;
    description = "sarah";
    shell = pkgs.fish;

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1j4tSWkFSt77q6cL8DbQ+VFlwXM/BWUsJXHpCIiP18qSNiCXuST+67OAZCvKgpwF87E2KwmKdDzrevkPy7oviVKefiKsW3zb5uY6LdPXvuH4fguztAISfDFLKvgTe437tUROPwy0JEtgiqSYkueMHjerDnpAFfYfBsrzRQ8vNS3K70vBPfSuwPsgOcTLZ6K6npC+xvjBoT6KzLV4wPuQTsc65IRYoqjW1kp7JT/v1rMcgpzxuYmy9ZvdQ2cnoAuQcbEABjtzRLAn46iB3mwTtHYNQmQnYQwzeymuipxhCeVjaPMekm2EX+RKR2fpZt1/fXo/hPYZrlVVCHexy4GnC9zkAgqUz99EYChSe4mY8eZzk7yAf6y0N4d7Fh1xcM7S96AbeGeosgxW/tV7Qr7W9gsg1ZgFxyw7tZ9ZhJWAGEt0TTlSyNcruSPgfysINjPqx2CVY/cED+U8Z0Q6ix6cFYW9Yq/A7tIrnOBuiVWklwRPC+n9bM8ZMUnRmzlvcpolWIUA7bjzoBWKNDeUEo93gfOpQC+bN0qSnfWR01O0ez3hT6DjVssjk2M9AK1ah2VJSFXHz97SHu0VRlAKqu1MjjZOXZX+DKH9FFcMeK1du59H+UsppE9+Z2wuL2mNSQpNj0ipYnQpiTekv6Lycly8/P+K5jLrFd2KRJyf7apyoIw== sarah@Im-so-Fuckinffngfffghjjhhgf-Computer-2.local"
    ];
  };

  programs.fish = {
    enable = true;
  };
}
