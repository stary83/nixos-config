{ config, pkgs, lib, ... }: {
  imports = [
    # ./hyprlock.nix
    # ./hypridle.nix
    ./waybar.nix
    # ./dwmbar.nix
    ./swww.nix
    ./basicfilesetting.nix
  ];
}
