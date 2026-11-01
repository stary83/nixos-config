{ pkgs, inputs, host, ... }:
{
  programs.niri = {
    enable = true;
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  home-manager.users.${host}.imports = [
    ../home-manager/niri.nix
  ];
}
