let
  keys = {
    robin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPgHRgDdmenFi5SH02Rrja7iICXUAQQJqdQACPLY9S/1 four@robin";
    root = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO/BGGfvvb8w9FEuMvn8VFvJtyT1dufFbcEIP1h6vxia root@robin";
  };
in keys // {
  admins = [ keys.robin keys.root ];
  all = builtins.attrValues keys;
}
