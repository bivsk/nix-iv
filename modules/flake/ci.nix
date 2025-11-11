{ inputs, ... }:
{
  imports = [ inputs.hercules-ci-effects.flakeModule ];

  hercules-ci.flake-update = {
    enable = true;
    when = {
      hour = [ 22 ];
      dayOfWeek = [ "Mon" ];
    };
  };

  herculesCI.ciSystems = [ "x86_64-linux" ];
}
