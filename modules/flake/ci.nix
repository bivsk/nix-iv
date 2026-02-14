{ inputs, ... }:
{
  imports = [ inputs.hercules-ci-effects.flakeModule ];

  hercules-ci.flake-update = {
    enable = true;

    baseMerge.enable = true;
    flakes.".".commitSummary = "chore: update flake.lock";
    pullRequestTitle = "chore: update flake.lock";
    autoMergeMethod = "squash";

    when = {
      hour = [ 9 ]; # UTC
      dayOfWeek = [
        "Tue"
        "Thu"
        "Sat"
      ];
    };
  };

  herculesCI.ciSystems = [ "x86_64-linux" ];
}
