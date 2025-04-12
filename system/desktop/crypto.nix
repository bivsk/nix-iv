{ config, lib, pkgs, ... }:

{
  # trezor
  services.trezord.enable = true;

  # ledger
  hardware.ledger.enable = true;

  # TODO: look into https://github.com/romanz/trezor-agent
}
