{
  flake.modules.nixos.android =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      inherit (lib)
        attrNames
        const
        filterAttrs
        getAttr
        ;
    in
    {
      environment.systemPackages = [
        pkgs.jmtpfs
        pkgs.android-tools
      ];

      users.extraGroups.adbusers.members =
        config.users.users |> filterAttrs (const <| getAttr "isNormalUser") |> attrNames;
    };
}
