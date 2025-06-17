{
  lib,
  fetchFromGitHub,
  pkg-config,
  rustPlatform,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "tari";
  version = "4.3.1";

  src = fetchFromGitHub {
    owner = "tari-project";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-AbNhT5SG0Og3yp4716RyiBzcdpfQfQemd8vwhigQs9w=";
  };

  # useFetchCargoVendor = true; # ???
  # cargoHash = "sha256-do93NlMIdUrvUhom/Sv9ZmPllqIDPlacWFF16s8/1qw=";
  cargoDeps = rustPlatform.importCargoLock {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "ledger-transport-0.11.0" = "sha256-2hUNLsJEFzABowpnDkJCtqr45dEF07iL77+ijEIBkZo=";
      "liblmdb-sys-0.2.3" = "sha256-Y+KRHyR632gD7obckcdw1h9rh6jb9xLVv/7j2nG/yZI=";
    };
  };

  nativeBuildInputs = [pkg-config];

  meta = with lib; {
    description = "";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}
