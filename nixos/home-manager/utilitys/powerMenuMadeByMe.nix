
{ pkgs, ... }:

let
  powerMenuMadeByMe = pkgs.writeScriptBin "powerMenuMadeByMe" ''
    #!${pkgs.bash}/bin/bash

    handle_logout() {
      case "$DESKTOP_SESSION" in
        hyprland)
          hyprctl dispatch exit
          ;;
        sway)
          swaymsg exit
          ;;
        i3)
          i3-msg exit
          ;;
        river)
          riverctl exit
          ;;
        niri)
          niri msg action quit
          ;;
        Openbox)
          openbox --exit
          ;;
        bspwm)
          bspc quit
          ;;
        xfce)
          killall xfce4-session
          ;;
        *)
          notify-send -t 1500 \
            "Logout for '$DESKTOP_SESSION' not implemented."
          exit 1
          ;;
      esac
    }

    shutdown=" 󰐥 | Shutdown"
    reboot="  | Restart"
    lock="  | Lock"
    suspend=" 󰤄 | Suspend"
    logout=" 󰍂 | Logout"

    chosen=$(
      printf '%s\n' \
        "$shutdown" \
        "$reboot" \
        "$logout" \
        "$suspend" \
        "$lock" |
        ${pkgs.fuzzel}/bin/fuzzel \
          --dmenu \
          --prompt="Power: " \
          --lines=5 \
          --width=26 \
          --minimal-lines \
          --no-sort
    ) || exit 0

    case "$chosen" in
      "$shutdown")
        systemctl poweroff
        ;;
      "$reboot")
        systemctl reboot
        ;;
      "$lock")
        lockScreenMadeByMe
        ;;
      "$suspend")
        systemctl suspend
        ;;
      "$logout")
        handle_logout
        ;;
    esac
  '';

in {
  home.packages = [
    powerMenuMadeByMe
  ];
}
