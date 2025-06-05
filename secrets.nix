let
  inherit (import ./keys.nix) kagome robin admins all;
in {
  # robin
  "hosts/robin/id.age".publicKeys = [ robin ] ++ admins;
  "hosts/robin/password.age".publicKeys = [ robin ] ++ admins;

  # kagome
  "hosts/kagome/id.age".publicKeys = [ kagome ] ++ admins;
  "hosts/kagome/password.age".publicKeys = [ kagome ] ++ admins;

  # common
  "modules/ssh/config.age".publicKeys = all;
}
