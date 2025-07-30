{
  flake.modules.nixos.jellyfin = {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };
    services.jellyseerr = {
      enable = true;
      # openFirewall = true;
    };

    # Manually open ports, as the above option doesn't seem to work
    networking.firewall = {
      interfaces.wg0.allowedTCPPorts = [ 5055 ];
      interfaces.enp69s0.allowedTCPPorts = [ 5055 ];
    };
  };
}
