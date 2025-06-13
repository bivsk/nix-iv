{ 
  lib, 
  pkgs,
  stdenv,
  fetchurl, 
  rustPlatform,
  fetchNpmDeps,
  cargo-tauri,
  cmake,
  glib-networking,
  gobject-introspection,
  libayatana-appindicator,
  nodejs,
  npmHooks,
  openssl,
  perl,
  pkg-config,
  protobuf,
  randomx,
  typescript,
  gst_all_1,
  webkitgtk_4_1,
  wrapGAppsHook4
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "tari-universe";
  version = "1.2.9";

  src = fetchurl {
    url = "https://github.com/tari-project/universe/archive/refs/tags/v${finalAttrs.version}.tar.gz";
    hash = "sha256-GIT/In71dhAt2U0tLucJZ/qN2nmIZtBF43lGPwlaxq4=";
  };

  npmDeps = fetchNpmDeps {
    name = "${finalAttrs.pname}-${finalAttrs.version}-npm-deps";
    inherit (finalAttrs) src;
    hash = "sha256-XSFj8EANatZ0nBPq2JKQhdRoJoNM2TBNrEXXJwECxaE=";
  };

  nativeBuildInputs = 
    [
      cargo-tauri.hook
      cmake
      nodejs
      npmHooks.npmConfigHook
      perl
      protobuf
      randomx
      typescript
      wrapGAppsHook4
    ]
    ++ lib.optionals stdenv.hostPlatform.isLinux [
      pkg-config
    ];

  buildInputs = lib.optionals stdenv.hostPlatform.isLinux [
    glib-networking
    gst_all_1.gst-plugins-good
    libayatana-appindicator
    openssl
    webkitgtk_4_1
  ];

  # TODO: look into failing tests
  doCheck = false;

  cargoRoot = "src-tauri";
  cargoHash = "sha256-y7pL6te6d8AqapKLCTauP/6uIrNZRfQru2m9r7prK1I=";
  buildAndTestSubdir = finalAttrs.cargoRoot;
  useFetchCargoVendor = true;

  env = {
    TARI_NETWORK = "mainnet";
    TARI_TARGET_NETWORK = "mainnet";
    OS_BINARY_NAME = if stdenv.hostPlatform.isLinux then "tari_universe" else "Tari Universe";
  };

  postPatch = ''
    substituteInPlace $cargoDepsCopy/libappindicator-sys-*/src/lib.rs \
      --replace-fail "libayatana-appindicator3.so.1" "${libayatana-appindicator}/lib/libayatana-appindicator3.so.1"

    # don't run the tauri updater
    sed -i 's/"createUpdaterArtifacts": *true/"createUpdaterArtifacts": false/' src-tauri/tauri.conf.json
  '';

  # use randomx from nix
  RUSTFLAGS = (builtins.map (a: ''-L ${a}/lib'') [
    randomx
  ]);

  meta = {
    description = "The beautifully simple mining app for mining Tari.";
    homepage = "https://www.tari.com/downloads";
    license = lib.licenses.cpal10;
    platforms = lib.platforms.linux;
    mainProgram = "tari_universe";
  };
})
