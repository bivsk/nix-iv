{
  flake.modules.homeManager.chromium.programs.chromium = {
    enable = true;
    extensions = [
      # Bitwarden
      # https://chromewebstore.google.com/detail/bitwarden-password-manage/nngceckbapebfimnlniiiahkandclblb
      { id = "nngceckbapebfimnlniiiahkandclblb"; }
      # Rabby Wallet
      # https://chromewebstore.google.com/detail/rabby-wallet/acmacodkjbdgmoleebolmdjonilkdbch
      { id = "acmacodkjbdgmoleebolmdjonilkdbch"; }
      # uBlock Origin Lite
      # https://chromewebstore.google.com/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; }
    ];
  };
}
