{ pkgs, inputs, host, ... }:
{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    withUWSM = true;
  };

  home-manager.users.${host}.imports = [
    ../home-manager/hyprland/hyprland.nix
  ];
}
