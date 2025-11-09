{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  networking.wireguard.interfaces.wg0 = {
    ips = [ "10.100.0.1/24" ];
    listenPort = 51820;
    privateKeyFile = "/etc/wireguard/privatekey";
    peers = [
      {
        publicKey = "0hrwVOfaPGTs2bfHoGrHroHGqG2aJiiu8JO9o5/K0xg=";
        allowedIPs = [ "10.100.0.2/32" ];
      }
    ];
  };

  networking.enableIPv6 = true;
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = true;
    "net.ipv6.conf.all.forwarding" = true;
  };

  networking.nat = {
    enable = true;
    externalInterface = "enp1s0";
    internalInterfaces = [ "wg0" ];
  };

  networking.firewall = {
    extraCommands = ''
      iptables -t nat -F PREROUTING
      iptables -t nat -A PREROUTING -i enp1s0 -p tcp ! --dport 2222 -j DNAT --to-destination 10.100.0.2
      iptables -t nat -A PREROUTING -i enp1s0 -p udp ! --dport 2222 -j DNAT --to-destination 10.100.0.2
      iptables -t nat -A POSTROUTING -o wg0 -j MASQUERADE
    '';
  };
}
