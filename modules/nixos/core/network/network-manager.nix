{
  flake.modules.nixos.network-manager =
    { config, lib, ... }:
    let
      inherit (lib)
        attrNames
        const
        filterAttrs
        getAttr
        ;
    in
    {
      networking.networkmanager.enable = true;

      users.extraGroups.networkmanager.members =
        config.users.users |> filterAttrs (const <| getAttr "isNormalUser") |> attrNames;

      environment.shellAliases.wifi = "nmcli dev wifi show-password";
    };
}
