{
  flake.modules.nixos.acme = {
    security.acme.acceptTerms = true;
    security.acme.defaults.email = "bivsk@tutanota.com";
  };
}
