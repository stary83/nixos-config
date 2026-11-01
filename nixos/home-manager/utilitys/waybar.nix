{ config, pkgs, lib, ... }:

{ 
  imports = [
    ./powerMenuMadeByMe.nix # required for power button
    ./lockScreenMadeByMe.nix
  ];
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      targets = "graphical-session.target";
    };
  };
  home.file.".config/waybar/config.jsonc" = {
    source = ../../resources/dots/waybar/config.jsonc;
  };
  home.file.".config/waybar/style.css" = {
    source = ../../resources/dots/waybar/style.css;
  };
  home.file.".config/waybar/colors.css" = {
    source = ../../resources/dots/waybar/colors.css;
  };
}
