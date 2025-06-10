# https://gitlab.freedesktop.org/drm/amd/-/issues/4277#note_2948979
{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (config.boot.kernelPackages) kernel;
  amdgpu-hang-fix = pkgs.fetchpatch {
    name = "amdgpu-hang-fix";
    url = "https://gitlab.freedesktop.org/agd5f/linux/-/commit/1b824eef269db44d068bbc0de74c94a8e8f9ce02.diff";
    hash = "sha256-LsmxcfL+ujHfTw+s7PMaRGYhuvCUWrc8vYhu6yMSzno=";
  };
  amdgpu-kernel-module = pkgs.stdenv.mkDerivation {
    pname = "amdgpu-kernel-module";
    inherit (kernel)
      src
      version
      postPatch
      nativeBuildInputs
      ;

    kernel_dev = kernel.dev;
    kernelVersion = kernel.modDirVersion;

    modulePath = "drivers/gpu/drm/amd/amdgpu";

    buildPhase = ''
      BUILT_KERNEL=$kernel_dev/lib/modules/$kernelVersion/build

      cp $BUILT_KERNEL/Module.symvers .
      cp $BUILT_KERNEL/.config        .
      cp $kernel_dev/vmlinux          .

      make "-j$NIX_BUILD_CORES" modules_prepare
      make "-j$NIX_BUILD_CORES" M=$modulePath modules
    '';

    installPhase = ''
      make \
        INSTALL_MOD_PATH="$out" \
        XZ="xz -T$NIX_BUILD_CORES" \
        M="$modulePath" \
        modules_install
    '';

    meta = {
      description = "AMD GPU kernel module";
      license = lib.licenses.gpl3;
    };
  };
in
{
  boot.extraModulePackages = [
    (amdgpu-kernel-module.overrideAttrs { patches = [ amdgpu-hang-fix ]; })
  ];
}

