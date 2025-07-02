{
  flake.modules.nixos.robin = {
    boot.initrd.availableKernelModules = [
      "sd_mod"
      "uas"
      "usbhid"
      "usb_storage"
      "thunderbolt"
      "xhci_pci"
    ];
  };
}
