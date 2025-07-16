{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        # Multimedia
        ffmpeg
        ffmpegthumbnailer
        gthumb
        imagemagick
        vlc
      ];
    };
}
