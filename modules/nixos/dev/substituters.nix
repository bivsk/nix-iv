let
  substituters = [
    # {
    #   url = "https://cache.bivsk.com/nixos";
    #   publicKey = "nixos-default:6H8Sn30qcMvSIEzFWZpee5R0DE+X6mECbsjSzdiwdWI=";
    #   priority = 1;
    # }
    {
      url = "https://cache.nixos.org";
      publicKey = "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";
      priority = 2;
    }
    {
      url = "https://nix-community.cachix.org";
      publicKey = "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
      priority = 3;
    }
  ];
in
{
  flake.modules.nixos.substituters = {
    nix.settings = {
      trusted-public-keys = builtins.catAttrs "publicKey" substituters;

      substituters = builtins.map (def: "${def.url}?priority=${toString def.priority}") substituters;
    };
  };
}
