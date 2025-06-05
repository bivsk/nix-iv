{ lib, fetchFromGitHub, pkg-config, rustPlatform, ... }:

rustPlatform.buildRustPackage rec {
  pname = "tari";
  version = "4.0.0";

  src = fetchFromGitHub {
    owner = "bivsk";
    repo = pname;
    rev = "6de5b02bb5d5ba0b4153a42336fb3978f13a89d1";
    hash = "sha256-Be+DkQytStNDWZLn7ONwjo+gadrt2xwLL5JzTSYHhMk=";
  };

  # useFetchCargoVendor = true; # ???
  cargoHash = "sha256-BvxJG+NNEdqLVdR9tvj6FC3nNBSRpVTeZX4QnJS4ehs=";

  nativeBuildInputs = [ pkg-config ];

  meta = with lib; {
    description = "";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}
