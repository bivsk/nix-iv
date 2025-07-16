{
  flake.modules.nixos.desktop =
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
      users.extraGroups.video.members =
        config.users.users |> filterAttrs (const <| getAttr "isNormalUser") |> attrNames;

      security.polkit.enable = true;

      services = {
        libinput.enable = true;
      };
    };
}
