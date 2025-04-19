{
  self,
  inputs,
  ...
}: {
  imports = [
    ./browsers
    ./terminal.nix
    # inputs.nix-index-db.hmModules.nix-index
  ];

  home = {
    username = "four";
    homeDirectory = "/home/four";
    stateVersion = "24.05";
    extraOutputsToInstall = ["doc" "devdoc"];
  };

  # disable manuals as nmd fails to build often
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  # let HM manage itself when in standalone mode
  programs.home-manager.enable = true;
}
