{ inputs, ... }:
{
  imports = [ inputs.hercules-ci-effects.flakeModule ];

  hercules-ci.flake-update = {
    enable = true;
    baseMerge = {
      enable = true;
      method = "fast-forward";
    };
    autoMergeMethod = "rebase";
    flakes.".".commitSummary = "chore: update `flake.lock`";
    pullRequestTitle = "chore: update `flake.lock`";
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
