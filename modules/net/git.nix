{
  self,
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    attrValues
    head
    mkAfter
    enabled
    merge
    mkIf
    ;
  inherit (lib.strings) match;
in
{
  environment.shellAliases =
    merge {
      g = "git";

      ga = "git add";
      gaa = "git add ./";

      gab = "git absorb";
      gabr = "git absorb --and-rebase";

      gb = "git branch";
      gbv = "git branch --verbose";

      gc = "git commit";
      gca = "git commit --amend --no-edit";
      gcm = "git commit --message";
      gcam = "git commit --amend --message";

      gcl = "git clone";

      gd = "git diff";
      gds = "git diff --staged";

      gp = "git push";
      gpf = "git push --force-with-lease";

      gl = "git log";
      glo = "git log --oneline --graph";
      glp = "git log -p --ext-diff";

      gpl = "git pull";
      gplr = "git pull --rebase";
      gplff = "git pull --ff-only";

      gr = "git recent";

      grb = "git rebase";
      grba = "git rebase --abort";
      grbc = "git rebase --continue";
      grbi = "git rebase --interactive";
      grbm = "git rebase master";

      grl = "git reflog";

      grm = "git remote";
      grma = "git remote add";
      grmv = "git remote --verbose";
      grmsu = "git remote set-url";

      grs = "git reset";
      grsh = "git reset --hard";

      gs = "git stash";
      gsp = "git stash pop";

      gsw = "git switch";
      gswm = "git switch master";

      gsh = "git show --ext-diff";

      gst = "git status";
    }
    <| mkIf config.isDesktop {
      "ask" = "gh copilot suggest --target shell --";
      "ask-gh" = "gh copilot suggest --target gh    --";
      "ask-git" = "gh copilot suggest --target git   --";
    };

  environment.systemPackages = attrValues {
    inherit (pkgs)
      git-absorb
      tig
      ;
  };

  home-manager.sharedModules = [
    (
      homeArgs:
      let
        homeConfig = homeArgs.config;
      in
      {
        programs.git = enabled {
          userName = "bivsk";
          userEmail = "bivsk@tutanota.com";

          lfs = enabled;

          difftastic = enabled {
            background = "dark";
          };

          extraConfig =
            merge {
              init.defaultBranch = "master";

              commit.verbose = true;

              log.date = "iso";
              column.ui = "auto";

              branch.sort = "-committerdate";
              tag.sort = "version:refname";

              diff.algorithm = "histogram";
              diff.colorMoved = "default";

              pull.rebase = true;
              push.autoSetupRemote = true;

              merge.conflictStyle = "zdiff3";

              rebase.autoSquash = true;
              rebase.autoStash = true;
              rebase.updateRefs = true;
              rerere.enabled = true;

              fetch.fsckObjects = true;
              receive.fsckObjects = true;
              transfer.fsckobjects = true;

              # https://bernsteinbear.com/git
              alias.recent = "! git branch --sort=-committerdate --format=\"%(committerdate:relative)%09%(refname:short)\" | head -10";
            }
            <| mkIf config.isDesktop {
              core.sshCommand = "ssh -i ~/.ssh/id";

              commit.gpgSign = true;
              tag.gpgSign = true;

              gpg.format = "ssh";
              user.signingKey = "~/.ssh/id";
            };
        };
      }
    )

    (mkIf config.isDesktop {
      programs.gh = enabled {
        settings.git_protocol = "ssh";
      };
    })
  ];
}
