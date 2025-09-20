{
  flake.modules.homeManager.ghostty =
    { lib, ... }:
    {
      home.sessionVariables = {
        TERMINAL = "ghostty";
      };

      programs.ghostty = {
        enable = true;

        clearDefaultKeybinds = true;

        settings = {
          mouse-hide-while-typing = true;
          confirm-close-surface = false;
          working-directory = "home";
          window-inherit-working-directory = false;

          keybind =
            lib.mapAttrsToList (name: value: "ctrl+shift+${name}=${value}") {
              KeyC = "copy_to_clipboard";
              KeyV = "paste_from_clipboard";

              KeyZ = "jump_to_prompt:-2";
              KeyX = "jump_to_prompt:2";

              KeyH = "write_scrollback_file:paste";
              KeyI = "inspector:toggle";

              PageDown = "scroll_page_fractional:0.33";
              ArrowDown = "scroll_page_lines:1";
              KeyJ = "scroll_page_lines:1";

              PageUp = "scroll_page_fractional:-0.33";
              ArrowUp = "scroll_page_lines:-1";
              KeyK = "scroll_page_lines:-1";

              Home = "scroll_to_top";
              End = "scroll_to_bottom";

              Enter = "reset_font_size";
              Equal = "increase_font_size:1";
              Minus = "decrease_font_size:1";

              KeyT = "new_tab";
              KeyQ = "close_surface";

              "Digit1" = "goto_tab:1";
              "Digit2" = "goto_tab:2";
              "Digit3" = "goto_tab:3";
              "Digit4" = "goto_tab:4";
              "Digit5" = "goto_tab:5";
              "Digit6" = "goto_tab:6";
              "Digit7" = "goto_tab:7";
              "Digit8" = "goto_tab:8";
              "Digit9" = "goto_tab:9";
              "Digit0" = "goto_tab:10";
            }
            ++ lib.mapAttrsToList (name: value: "ctrl+${name}=${value}") {
              "Tab" = "next_tab";
              "shift+Tab" = "previous_tab";
            };
        };
      };
    };
}
