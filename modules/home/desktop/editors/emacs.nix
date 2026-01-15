{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      programs.emacs = {
        enable = true;
        package = pkgs.emacs-pgtk;
        # extraConfig = ''
        #   	  (setq standard-indent 2)
        #   	'';
        # extraPackages = epkgs: [
        #   epkgs.magit
        # ];
      };
      home.packages = [
        pkgs.emacs-all-the-icons-fonts
      ];

      # Enable the daemon
      services.emacs.enable = true;
    };
}
