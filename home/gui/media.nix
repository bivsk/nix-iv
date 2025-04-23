{}: {
  home.packages = with pkgs; [
    ani-cli
    pulsemixer
    pavucontrol
  ];

  programs = {
    mpv = {
      enable = true;
      scripts = with pkgs.mpvScripts; [
        uosc
	mpris
	autoload
      ];
    };
  };
}
