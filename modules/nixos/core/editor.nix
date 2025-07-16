{
  flake.modules.nixos.core = {
    programs.neovim = {
      enable = true;
      vimAlias = true;
      defaultEditor = true;
    };
    programs.nano.enable = false;
  };
}
