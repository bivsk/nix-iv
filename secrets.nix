let
  inherit (import ./keys.nix)
    kagome
    robin
    admins
    all
    ;
in
{
  # robin
  # "modules/hosts/robin/id.age".publicKeys = [ robin ] ++ admins;
  # "modules/hosts/robin/password.age".publicKeys = [ robin ] ++ admins;

  # kagome
  # "modules/hosts/kagome/id.age".publicKeys = [ kagome ] ++ admins;
  # "modules/hosts/kagome/password.age".publicKeys = [ kagome ] ++ admins;

  # common
  # "modules/networking/ssh/config.age".publicKeys = all;
}
