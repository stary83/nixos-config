{
  config,
  pkgs,
  lib,
  ...
}:
let
  appLauncherMenuMadeByMePackage = pkgs.writeScriptBin "alMenuMadeByMe" ''
    #!${pkgs.bash}/bin/bash
    ${pkgs.fuzzel}/bin/fuzzel
  '';

in
{
  imports = [
    ./fuzzel.nix
  ];
  home.packages = with pkgs; [ appLauncherMenuMadeByMePackage ];
}
