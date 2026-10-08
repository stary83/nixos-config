{ config, pkgs, ... }:

{

  # enabled here /etc/nixos/nixos/programs.nix
  home.file.".config/niri/config.kdl".source = ../resources/dots/niri/config.kdl;
  home.packages = with pkgs; [
    xwayland-satellite # needed for niri, its how niri manages x11
  ];

}
