let
  keys = {
    robin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPgHRgDdmenFi5SH02Rrja7iICXUAQQJqdQACPLY9S/1 four@robin";
    kagome = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINabwnzwbIu8RnQOYWVdA2nYAUX5xCcS6Sys6bpeAAcm four@kagome";
  };
in
  keys
  // {
    admins = [keys.robin keys.kagome];
    all = builtins.attrValues keys;
  }
