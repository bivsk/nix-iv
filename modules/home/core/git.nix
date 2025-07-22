{
  flake.modules.homeManager.core = {
    programs.git = {
      enable = true;
      userName = "bivsk";
      userEmail = "bivsk@tutanota.com";

      lfs.enable = true;

      difftastic = {
        enable = true;
        background = "dark";
      };

      extraConfig = {
        init.defaultBranch = "master";

        core.sshCommand = "ssh -i /run/agenix/ssh-github";

        commit.gpgSign = true;
        tag.gpgSign = true;

        gpg.format = "ssh";
        user.signingKey = "/run/agenix/ssh-github";

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
      };
    };

    programs.gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };

    home.shellAliases = {
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

      gch = "git checkout";

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
    };
  };
}
