{
  config,
  lib,
  ...
}:
let
  inherit (lib) enabled merge mkIf;
in
merge
<| mkIf config.isDesktop {
  home-manager.sharedModules = [
    {
      programs.zathura =
        with config.theme.withHashtag;
        enabled {
          options = {
            default-bg = "${base00}";
            default-fg = "${base07}";
          };
          extraConfig = config.theme.zathuraTheme;
        };
    }
  ];
}
