{ pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font:size=12";
        lines = 23;
        auto-select = true;
        anchor = "center";
      };
      colors = {
        background = "1e1e2edd";
        text = "cdd6f4ff";
        prompt = "bac2deff";
        placeholder= "7f849cff";
        input= "cdd6f4ff";
        match = "89b4faff";
        selection = "585b70ff";
        selection-text = "cdd6f4ff";
        selection-match = "89b4faff";
        counter= "7f849cff";
        border = "89b4faff";
      };
      border = {
        radius = 10;
        width = 2;
      };
    };
  };
}
