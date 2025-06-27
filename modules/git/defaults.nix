{ config, ... }:
{
  flake.modules.homeManager.base.programs.git = {
    userName = config.flake.meta.owner.userName;
    userEmail = config.flake.meta.owner.email;
    extraConfig = {
      init.defaultBranch = "master";
      push.default = "current";
      commit.verbose = true;
      branch.sort = "-committerdate";
      tag.sort = "taggerdate";
    };
  };
}
