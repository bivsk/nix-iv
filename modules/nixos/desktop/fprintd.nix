{
  flake.modules.nixos.fprintd = {
    services.fprintd.enable = true;

    environment.persistence."/persist".directories = [
      "/var/lib/fprint"
    ];
  };
}
