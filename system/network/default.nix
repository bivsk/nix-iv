{ pkgs, ... }:

{
  imports = [
    ./vpn.nix
  ];

  networking = {
    nameservers = ["9.9.9.9#dns.quad9.net"];

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.powersave = true;
    };
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        #PasswordAuthentication = false;
        UseDns = true;
      };
    };

    resolved = {
      enable = true;
      dnsovertls = "opportunistic";
    };
  };

  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];
}
