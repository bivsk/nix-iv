{ 
  lib, 
  stdenv,
  fetchFromGitHub, 
  rustPlatform,
  fetchNpmDeps,
  autoconf,
  cargo-tauri,
  cmake,
  glib-networking,
  nodejs,
  npmHooks,
  openssl,
  perl,
  pkg-config,
  protobuf,
  randomx,
  typescript,
  webkitgtk_4_1,
  wrapGAppsHook4
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "tari-universe";
  version = "1.2.8";

  src = fetchFromGitHub {
    owner = "bivsk";
    repo = "universe";
    rev = "85ead24d949acfb033856ed8f651410f22558670";
    # hash = "sha256-r+xVeKTZ52C0Fj01XocJR759Sp0qdRdmo85cl5nqxMs=";
    hash = "sha256-0KAoeP9NEVdHG70iNDLqr9hd6NNF3jXXJWkAj7Jj6Nc=";
  };

  npmDeps = fetchNpmDeps {
    name = "${finalAttrs.pname}-${finalAttrs.version}-npm-deps";
    inherit (finalAttrs) src;
    hash = "sha256-7aHYkXcUFWXXZ4KlPOn0E/qJsdm5HFVcVLz07hlskLQ=";
  };

  cargoRoot = "src-tauri";
  buildAndTestSubdir = finalAttrs.cargoRoot;

  useFetchCargoVendor = true;
  cargoHash = lib.fakeHash;

  nativeBuildInputs = 
    [
      cargo-tauri.hook
      autoconf
      cmake
      nodejs
      npmHooks.npmConfigHook
      perl
      protobuf
      randomx
      typescript
    ]
    ++ lib.optionals stdenv.hostPlatform.isLinux [
      pkg-config
      wrapGAppsHook4
    ];

  buildInputs = lib.optionals stdenv.hostPlatform.isLinux [
    glib-networking
    openssl
    webkitgtk_4_1
  ];

  meta = {
    description = "The beautifully simple mining app for mining Tari.";
    homepage = "https://www.tari.com/downloads";
    license = lib.licenses.cpal10;
    platforms = lib.platforms.linux;
    mainProgram = "tari-universe";
  };
})
