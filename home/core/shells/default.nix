{ inputs, pkgs, ... }: {
  # core shell utils
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # system monitoring
    btop
    ethtool
    htop
    iotop
    iftop
    lm_sensors
    nvtopPackages.amd
    pciutils
    sysstat
    usbutils

    # nix
    nix-output-monitor
    hydra-check # Check hydra for build status of a package
    nix-index # Index store paths
    nix-init # Generate nix derivation from url
    nix-melt # TUI flake.lock viewer
    nix-tree # TUI to visualize dependency graph of a nix derivation

    # utils
    eza
    duf
    du-dust
    fd
    fzf
    jq
    ripgrep

    # misc
    cowsay
    fastfetch
    file
    gawk
    gnupg
    gnused
    gnutar
    nitch
    tree
    which
  ];

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      bashrcExtra = ''
        export PATH="$HOME/.local/bin:$PATH"
      '';
    };

    starship = {
      enable = true;
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = true;
      };
    };

    yazi = {
      enable = true;
      package = inputs.yazi.packages.${pkgs.system}.default;
    };

    # a cat(1) clone with syntax highlighting and Git integration
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        #theme = "";
      };
    };
  };
}
