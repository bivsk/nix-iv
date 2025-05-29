let
  inherit (import ./keys.nix) robin admins all;
in {
  # robin
  "hosts/robin/id.age".publicKeys = [ robin ] ++ admins;
  "hosts/robin/password.age".publicKeys = [ robin ] ++ admins;

  # common
  "modules/ssh/config.age".publicKeys = all;
}
