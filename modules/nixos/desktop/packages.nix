{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        # Multimedia
        pkgs.ffmpeg
        pkgs.ffmpegthumbnailer
        pkgs.imagemagick
      ];
    };
}
