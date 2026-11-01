{ config, inputs, pkgs, ... }:
{
  programs = {
    ghostty = {
      enable = true;
      settings = {
        font-size = 12;
        window-decoration = false;
        confirm-close-surface = false;
        font-feature = ["-liga" "-dlig" "-calt"];
        theme = "Catppuccin Mocha";
        background-blur = 4;
      };
    };
  };
}
