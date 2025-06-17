# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  azuki = pkgs.callPackage ./azuki {};
  uzura = pkgs.callPackage ./uzura {};
  tari-universe = pkgs.callPackage ./tari-universe {};
  tari = pkgs.callPackage ./tari {};
}
