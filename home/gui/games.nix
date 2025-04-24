{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gamescope
    prismlauncher
    winetricks
    protontricks
  ];
}
