{ inputs, ... }:
{
  imports = [ inputs.hercules-ci-effects.flakeModule ];

  hercules-ci.flake-update = {
    enable = true;
    baseMerge = {
      enable = true;
      method = "fast-forward";
    };
    autoMergeMethod = "merge";
    # flakes."*".commitSummary = "chore: update flake inputs";
    pullRequestTitle = "chore: update flake.lock";
    when = {
      hour = [ 9 ]; # UTC
      dayOfWeek = [
        "Mon"
        "Wed"
        "Fri"
      ];
    };
  };

  herculesCI.ciSystems = [ "x86_64-linux" ];
}
