{ 
  lib, 
  pkgs,
  stdenv,
  fetchFromGitHub, 
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
  webkitgtk_4_1,
  wrapGAppsHook4
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "tari-universe";
  version = "1.2.8";

  src = fetchFromGitHub {
    owner = "tari-project";
    repo = "universe";
    tag = "v${finalAttrs.version}";
    fetchSubmodules = true;
    hash = "sha256-r+xVeKTZ52C0Fj01XocJR759Sp0qdRdmo85cl5nqxMs=";
  };

  npmDeps = fetchNpmDeps {
    name = "${finalAttrs.pname}-${finalAttrs.version}-npm-deps";
    inherit (finalAttrs) src;
    hash = "sha256-zdH/NsWHjEF1sekbm9qoI7+/K5v8YleGCR2KsAUapLU=";
  };

  nativeBuildInputs = 
    [
      cargo-tauri.hook
      cmake
      nodejs
      npmHooks.npmConfigHook
      gobject-introspection
      libayatana-appindicator
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
    libayatana-appindicator
    openssl
    webkitgtk_4_1
  ];

  # idk
  doCheck = false;

  cargoRoot = "src-tauri";
  cargoHash = "sha256-g4u65lh7VP7sE6UCdLYarq/q0lBXEYThNLr8vkDUNXU=";
  buildAndTestSubdir = finalAttrs.cargoRoot;
  useFetchCargoVendor = true;

  # don't run the tauri updater
  postPatch = ''
    sed -i 's/"createUpdaterArtifacts": *true/"createUpdaterArtifacts": false/' src-tauri/tauri.conf.json
    sed -i '111,117d' src-tauri/tauri.conf.json
  '';

  RUSTFLAGS = (builtins.map (a: ''-L ${a}/lib'') [
    pkgs.randomx
  ]);

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (finalAttrs.buildInputs ++ finalAttrs.nativeBuildInputs);

  meta = {
    description = "The beautifully simple mining app for mining Tari.";
    homepage = "https://www.tari.com/downloads";
    license = lib.licenses.cpal10;
    platforms = lib.platforms.linux;
    mainProgram = "Tari Universe (Alpha)";
  };
})
