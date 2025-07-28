{
  flake.modules.homeManager.emacs =
    { pkgs, ... }:
    {
      programs.emacs = {
        enable = true;
        package = pkgs.emacs-pgtk;
        extraConfig = ''
          	  (setq standard-indent 2)
          	'';
        extraPackages = epkgs: [
          epkgs.magit
        ];
      };

      # Enable the daemon
      services.emacs.enable = true;
    };
}
