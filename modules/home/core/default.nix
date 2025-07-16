{
  flake.modules.homeManager.core =
    { lib, ... }:
    {
      home = {
        username = lib.mkDefault "four";
        homeDirectory = lib.mkDefault "/home/four";
      };
    };
}
