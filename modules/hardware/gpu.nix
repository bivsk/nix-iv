{
  flake.modules.nixos.amd-gpu =
    { pkgs, ... }:
    {
      hardware.graphics = {
        enable = true;
        extraPackages = [ pkgs.rocmPackages.clr.icd ];
      };

      environment.systemPackages = [
        pkgs.clinfo
        pkgs.lact
        pkgs.nvtopPackages.amd
      ];

      systemd.packages = [ pkgs.lact ];
      systemd.services.lact.wantedBy = [ "multi-user.target" ];
    };
}
