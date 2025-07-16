{
  flake.modules.nixos.laptop =
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
      hardware.brillo.enable = true;
      users.extraGroups.video.members =
        config.users.users |> filterAttrs (const <| getAttr "isNormalUser") |> attrNames;
    };
}
