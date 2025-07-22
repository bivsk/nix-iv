{
  flake.modules.nixos.yubikey =
    { pkgs, ... }:
    {
      services = {
        pcscd.enable = true;
        udev.packages = [ pkgs.yubikey-personalization ];
      };
      home-manager.sharedModules = [
        {
          home.packages = [
            pkgs.age-plugin-yubikey
            pkgs.yubikey-manager
            pkgs.yubioath-flutter
          ];
        }
      ];
    };
}
