
{
  pkgs,
  ...
}:
let
  lockScreenMadeByMe = pkgs.writeScriptBin "lockScreenMadeByMe" ''
    #!${pkgs.bash}/bin/bash

    exec ${pkgs.swaylock-effects}/bin/swaylock \
      --screenshots \
      --effect-scale 0.35 \
      --effect-blur 5x2 \
      --effect-scale 2.857 \
      --fade-in 0.2 \
      --indicator \
      --indicator-radius 50 \
      --indicator-thickness 7 \
      --ignore-empty-password \
      --show-failed-attempts \
      --color 1e1e2e \
      --inside-color 1e1e2edd \
      --ring-color 89b4faff \
      --inside-clear-color 1e1e2edd \
      --ring-clear-color 89b4faff \
      --inside-ver-color 1e1e2edd \
      --ring-ver-color 89b4faff \
      --inside-wrong-color 1e1e2edd \
      --ring-wrong-color f38ba8ff \
      --line-color 00000000 \
      --separator-color 00000000 \
      --key-hl-color 89b4faff \
      --bs-hl-color f38ba8ff \
      --text-color cdd6f4ff \
      --text-clear-color cdd6f4ff \
      --text-ver-color cdd6f4ff \
      --text-wrong-color f38ba8ff
  '';
in
{
  home.packages = [
    lockScreenMadeByMe
  ];
}
