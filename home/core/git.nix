{
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "bivsk";
    userEmail = "bivsk@tutanota.com";

    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      pull.rebase = true;

      # replace https with ssh
      url = {
        "ssh://git@github.com/bivsk" = {
          insteadOf = "https://github.com/bivsk";
        };
      };
    };

    # syntax-highlighting pager
    delta = {
      enable = true;
      options = {
        diff-so-fancy = true;
        line-numbers = true;
        true-color = "always";
      };
    };

    aliases = {
      br = "branch";
      co = "checkout";
      st = "status";
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
      cm = "commit -m"; # commit via `git cm <message>`
      ca = "commit -am"; # commit all via `git am <message>`
      dc = "diff --cached";

      amend = "commit --amend -m"; # ammend commit message via `git amend <message>`
      unstage = "reset HEAD --";
      merged = "branch --merged";
      unmerged = "branch --no-merged";
      nonexist = "remote prune origin --dry-run";
    };
  };
}
