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
      programs.adb.enable = true;

      environment.systemPackages = with pkgs; [
        jmtpfs
      ];

      users.extraGroups.adbusers.members =
        config.users.users |> filterAttrs (const <| getAttr "isNormalUser") |> attrNames;
    };
}
