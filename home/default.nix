{ inputs, config, pkgs, ... }:

{
  home.username = "four";
  #home.homeDirectory = "/home/four";

  imports = [
    ./browsers.nix
    ./crypto.nix
    ./media
    ./code
    ./office
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fastfetch
    (inputs.yazi.packages.${pkgs.system}.default)

    # archives
    zip
    xz
    unzip
    p7zip

    # social
    vesktop
    telegram-desktop

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    bat
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    nix-output-monitor

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  programs.git = {
    enable = true;
    userName = "bivsk";
    userEmail = "bivsk@tutanota.com";
  };

  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.system}.default.override { enableX11 = false; }; # latest
    #enableBashIntegration = true;
    installBatSyntax = false;
    settings = {
      theme = "Solarized Dark - Patched";
      background-opacity = 0.93;
      window-decoration = false;
      window-padding-x = 6;
      window-padding-y = 6;
      confirm-close-surface = false;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = false;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/.local/bin"
    '';
  };

  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    #keyMode = "vi";
    mouse = true;
    newSession = true;
    prefix = "C-a";
    reverseSplit = true;
    sensibleOnTop = true;
    shell = "${pkgs.bashInteractive}/bin/bash";
    shortcut = "a";
  };

  programs.zed-editor = {
    enable = true;
    #package = inputs.zed-editor.packages.${pkgs.system}.default;
    extensions = []; # https://github.com/zed-industries/extensions/tree/main/extensions
    userSettings = {
      features = {
        copilot = false;
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      vim_mode = true;
    };
  };


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
