{ inputs, ... }:
{
  imports = [ inputs.hercules-ci-effects.flakeModule ];

  hercules-ci.flake-update = {
    enable = true;
    when = {
      hour = [ 3 ];
      dayOfWeek = [
        "Mon"
        "Wed"
        "Sat"
      ];
    };
  };

  herculesCI.ciSystems = [ "x86_64-linux" ];
}
