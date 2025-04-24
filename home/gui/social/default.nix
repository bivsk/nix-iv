{ pkgs, ... }: {
  home.packages = with pkgs; [
    telegram-desktop
  ];

  programs = {
    vesktop = {
      enable = true;
    };
  };
}
