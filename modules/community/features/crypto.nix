{ inputs, lib, ... }:
let
  inherit (lib) attrValues;

  flake.modules.nixos.crypto = {
    imports = [
      unfree
    ];
  };

  unfree = inputs.self.lib.unfree-module [
    "tradingview"
  ];

  hardware.ledger.enable = true;

  flake.modules.homeManager.crypto =
    { pkgs, ... }:
    {
      home.packages = 
        attrValues
	<| {
	  inherit (pkgs)
	    ledger-live-desktop
	    monero-gui
	    tradingview
	    ;
	};
    };
in
{
  inherit flake;
}
