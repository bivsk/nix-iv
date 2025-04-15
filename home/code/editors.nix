{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.vscode = {
    enable = true;
    #package = pkgs.vscodium;
    mutableExtensionsDir = true;
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
}
