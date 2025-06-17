{
  lib,
  pkgs,
  stdenv,
  fetchurl,
  rustPlatform,
  fetchNpmDeps,
  autoPatchelfHook,
  cargo-tauri,
  cmake,
  glib-networking,
  gtk3,
  jq,
  libayatana-appindicator,
  librsvg,
  libsoup_3,
  moreutils,
  nodejs,
  npmHooks,
  opencl-headers,
  openssl,
  perl,
  pkg-config,
  protobuf,
  randomx,
  rocmPackages,
  typescript,
  gst_all_1,
  webkitgtk_4_1,
  wrapGAppsHook4,
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

  useFetchCargoVendor = true;
  cargoHash = "sha256-y7pL6te6d8AqapKLCTauP/6uIrNZRfQru2m9r7prK1I=";

  postPatch = ''
    substituteInPlace $cargoDepsCopy/libappindicator-sys-*/src/lib.rs \
      --replace-fail "libayatana-appindicator3.so.1" "${libayatana-appindicator}/lib/libayatana-appindicator3.so.1"

    # remove (Alpha) from tauri.conf
    jq --arg name "Tari Universe" '.productName = $name' src-tauri/tauri.conf.json | sponge src-tauri/tauri.conf.json
    jq --arg name "$OS_BINARY_NAME" '.mainBinaryName = $name' src-tauri/tauri.conf.json | sponge src-tauri/tauri.conf.json
    jq --arg name "Tari Universe v${finalAttrs.version}" '.app.windows[0].title = $name' src-tauri/tauri.conf.json | sponge src-tauri/tauri.conf.json
    jq --arg name "com.tari.universe" '.identifier = $name' src-tauri/tauri.conf.json | sponge src-tauri/tauri.conf.json

    # don't run the tauri updater
    sed -i 's/"createUpdaterArtifacts": *true/"createUpdaterArtifacts": false/' src-tauri/tauri.conf.json
  '';

  # debug for now
  buildType = "debug";

  nativeBuildInputs =
    [
      autoPatchelfHook
      cargo-tauri.hook
      cmake
      jq
      moreutils
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
    webkitgtk_4_1
    gtk3
    libayatana-appindicator
    librsvg
    libsoup_3
    glib-networking
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
    openssl
    rocmPackages.clr.icd
    opencl-headers
  ];

  cargoRoot = "src-tauri";
  buildAndTestSubdir = finalAttrs.cargoRoot;

  # TODO: look into failing tests
  doCheck = false;

  env = {
    TARI_NETWORK = "mainnet";
    TARI_TARGET_NETWORK = "mainnet";
    OS_BINARY_NAME =
      if stdenv.hostPlatform.isLinux
      then "tari_universe"
      else "Tari Universe";
  };

  # preFixup = ''
  #   gappsWrapperArgs+=(
  #     --set-default WEBKIT_DISABLE_DMABUF_RENDERER 1
  #   )
  # '';

  # use randomx from nix
  RUSTFLAGS = builtins.map (a: ''-L ${a}/lib'') [
    randomx
  ];

  meta = {
    description = "The beautifully simple mining app for mining Tari.";
    homepage = "https://www.tari.com/downloads";
    license = lib.licenses.cpal10;
    platforms = lib.platforms.linux;
    mainProgram = "tari_universe";
  };
})
