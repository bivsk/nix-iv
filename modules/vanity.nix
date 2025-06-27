{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        cowsay
        fastfetch
        lolcat
      ];
    };
}
