{ config, pkgs, ... }:

{
  imports = [
    ./utilitys/swayidle.nix
    ./utilitys/mako.nix
    ./utilitys/waybar.nix
    ./utilitys/authentication-agent.nix
    ./utilitys/lockScreenMadeByMe.nix
    ./utilitys/applauncherMenuMadeByMe.nix
  ];

  home.file.".config/niri/config.kdl".text = ''
    //   █████████            █████     █████     ███
    //  ███░░░░░███          ░░███     ░░███     ░░░
    // ░███    ░░░   ██████  ███████   ███████   ████  ████████    ███████  █████
    // ░░█████████  ███░░███░░░███░   ░░░███░   ░░███ ░░███░░███  ███░░███ ███░░
    //  ░░░░░░░░███░███████   ░███      ░███     ░███  ░███ ░███ ░███ ░███░░█████
    //  ███    ░███░███░░░    ░███ ███  ░███ ███ ░███  ░███ ░███ ░███ ░███ ░░░░███
    // ░░█████████ ░░██████   ░░█████   ░░█████  █████ ████ █████░░███████ ██████
    //  ░░░░░░░░░   ░░░░░░     ░░░░░     ░░░░░  ░░░░░ ░░░░ ░░░░░  ░░░░░███░░░░░░
    //                                                            ███ ░███
    //                                                            ░░██████
    //                                                            ░░░░░░

    include "./colors.kdl"

    input {
        mod-key "Super"
        mod-key-nested "Super"
        keyboard {
            xkb {
                // For more information, see xkeyboard-config(7).
                layout "us,ir"
                options "grp:alt_space_toggle"
            }
            repeat-delay 300
            repeat-rate 30
            // Enable numlock on startup, omitting this setting disables it.
            numlock
        }
        // Omitting settings disables them, or leaves them at their default values.
        touchpad {
            tap
            drag true
            drag-lock
            natural-scroll
            accel-speed 0.0
            accel-profile "flat"
            scroll-method "two-finger"
            middle-emulation
        }
        mouse {
            accel-speed 0.0
            accel-profile "flat"
            middle-emulation
        }
        
        warp-mouse-to-focus mode="center-xy"
        focus-follows-mouse max-scroll-amount="10%"
    }

    output "eDP-1" {
        // off
        mode "1920x1200@60.002"

        scale 1.40 // You can use integer or fractional scale, for example use 1.5 for 150% scale.
        transform "normal" // normal, 90, 180, 270, flipped, flipped-90, flipped-180 and flipped-270.
        position x=0 y=0
    }
    
    layout {
        gaps 8
        center-focused-column "on-overflow" // options are: "never", "always", "on-overflow"
        background-color "transparent" // Needed to show swww-daemon from the background
        default-column-display "normal"
        always-center-single-column

        // If you leave the brackets empty, the windows themselves will decide their initial width.
        default-column-width { proportion 0.9; }

        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
            proportion 0.9
        }
        preset-window-heights {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
            proportion 1.0
        }
        focus-ring {
            off
        }
        border {
            width 2
        }
        shadow {
            off
        }
        tab-indicator {
            hide-when-single-tab
            place-within-column
            gap 6
            width 2
            length total-proportion=1.0
            position "left"
            gaps-between-tabs 2
            corner-radius 5
            active-color "blue"
            inactive-color "gray"
            urgent-color "red"
        }
        insert-hint {
        }
    }

    

    // Animation settings.
    animations {
        slowdown 2.0
    }

    environment {
        // DISPLAY ":0"
        TERMINAL "ghostty"
        TERM "ghostty"
        XCURSOR_SIZE "18"
        XDG_CURRENT_DESKTOP "Niri"
        XDG_SESSION_DESKTOP "Niri"
        XDG_SESSION_TYPE "wayland"
        DESKTOP_SESSION "niri"
        MOZ_ENABLE_WAYLAND "1"
        ELECTRON_OZONE_PLATFORM_HINT "wayland"
        BEMENU_BACKEND "wayland"
        CLUTTER_BACKEND "wayland"
        SDL_VIDEODRIVER "wayland"
        QT_QPA_PLATFORM "wayland;xcb"
        QT_QPA_PLATFORMTHEME "qt6ct"
        QT_WAYLAND_DISABLE_WINDOWDECORATION "1"
        QT_SCALE_FACTOR "1"
        QT_AUTO_SCREEN_SCALE_FACTOR "1"
        GDK_SCALE "1"
        GDK_BACKEND "wayland,x11,*"
        GTK_USE_PORTAL "1"
        WLR_NO_HARDWARE_CURSORS "1"
    }

    cursor {
        // xcursor-theme "Bibata-Modern-Classic"
        xcursor-size 24
        hide-when-typing
        hide-after-inactive-ms 10000
    }

    overview {
        zoom 0.5
        workspace-shadow {
            softness 60
            spread 20
            offset x=0 y=10
            color "#00000090"
        }
    }

    layer-rule {
        // Send swww wallpaper to backdrop, show behind overview too
        // Set backdrop-color to transparent in layout
        match namespace="awww-daemon"
        place-within-backdrop true
    }

    clipboard {
        // disable-primary // Disable the middle click paste clipboard
    }

    hotkey-overlay {
        hide-not-bound
        skip-at-startup
    }

    gestures {
        dnd-edge-view-scroll {
            trigger-width 30
            delay-ms 100
            max-speed 1500
        }
        dnd-edge-workspace-switch {
            trigger-height 50
            delay-ms 100
            max-speed 1500
        }
        hot-corners {
            off
        }
    }

    switch-events {
    }

    //    █████████               █████                      █████                         █████
    //   ███░░░░░███             ░░███                      ░░███                         ░░███
    //  ░███    ░███  █████ ████ ███████    ██████   █████  ███████    ██████   ████████  ███████
    //  ░███████████ ░░███ ░███ ░░░███░    ███░░███ ███░░  ░░░███░    ░░░░░███ ░░███░░███░░░███░
    //  ░███░░░░░███  ░███ ░███   ░███    ░███ ░███░░█████   ░███      ███████  ░███ ░░░   ░███
    //  ░███    ░███  ░███ ░███   ░███ ███░███ ░███ ░░░░███  ░███ ███ ███░░███  ░███       ░███ ███
    //  █████   █████ ░░████████  ░░█████ ░░██████  ██████   ░░█████ ░░████████ █████      ░░█████
    // ░░░░░   ░░░░░   ░░░░░░░░    ░░░░░   ░░░░░░  ░░░░░░     ░░░░░   ░░░░░░░░ ░░░░░        ░░░░░

    spawn-at-startup "awww-daemon"
    spawn-at-startup "waybar"
    spawn-at-startup "mako"
    spawn-at-startup "awww" "img" "--transition-type" "center" "~/.current_wallpaper"

    prefer-no-csd

    //  ███████████              ████
    // ░░███░░░░░███            ░░███
    //  ░███    ░███  █████ ████ ░███   ██████   █████
    //  ░██████████  ░░███ ░███  ░███  ███░░███ ███░░
    //  ░███░░░░░███  ░███ ░███  ░███ ░███████ ░░█████
    //  ░███    ░███  ░███ ░███  ░███ ░███░░░   ░░░░███
    //  █████   █████ ░░████████ █████░░██████  ██████
    // ░░░░░   ░░░░░   ░░░░░░░░ ░░░░░  ░░░░░░  ░░░░░░

    window-rule {
        geometry-corner-radius 5
        clip-to-geometry true
    }

    window-rule {
        match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#
        default-floating-position x=10 y=10 relative-to="bottom-right"
    }

    // Float rule
    window-rule {
        match title="Steam Settings" 
        match app-id="galculator"
        match app-id="nm-connection-editor"
        match title="gtk*"
        match app-id="nwg-look"
        match app-id="qt6ct"
        match app-id="qt5ct"
        match app-id="firefox" title="Picture-in-Picture"
        match app-id="floorp" title="Picture-in-Picture"
        match app-id="google-chrome" title="Picture-in-Picture"
        match app-id="org.pulseaudio.pavucontrol"
        match title="popup title with spaces"
        match title="Picture-in-Picture"

        open-floating true
        open-focused true
        default-column-width { }
        default-window-height { }
    }

    // Fullscreen rule
    window-rule {
        match app-id="Minecraft"
        open-focused true
        open-fullscreen true
    }

    //  ███████████   ███                 █████
    // ░░███░░░░░███ ░░░                 ░░███
    //  ░███    ░███ ████  ████████    ███████   █████
    //  ░██████████ ░░███ ░░███░░███  ███░░███  ███░░
    //  ░███░░░░░███ ░███  ░███ ░███ ░███ ░███ ░░█████
    //  ░███    ░███ ░███  ░███ ░███ ░███ ░███  ░░░░███
    //  ███████████  █████ ████ █████░░████████ ██████
    // ░░░░░░░░░░░  ░░░░░ ░░░░ ░░░░░  ░░░░░░░░ ░░░░░░

    binds {
        // shows a list of important hotkeys.
        Mod+Shift+Slash { show-hotkey-overlay; }

        // You can also move the mouse into the top-left hot corner,
        // or do a four-finger swipe up on a touchpad.
        Mod+Tab repeat=false { toggle-overview; }

        Mod+Q       { close-window;                }
        Mod+Shift+Q { quit;                        }
        Alt+F4      { close-window;                }

        Mod+Ctrl+F  { toggle-window-floating;      }
        Mod+F11     { toggle-windowed-fullscreen;  }
        F11         { fullscreen-window;           }

        Mod+Return  { maximize-column;             }          

        Mod+Alt+C { center-column; }
        Mod+Alt+T { toggle-column-tabbed-display; }
        Mod+Alt+F { switch-focus-between-floating-and-tiling; }

        

        // Program binds
        Mod+T { spawn "ghostty"; }

        // Scripts
        Ctrl+Alt+W    { spawn "pkill waybar && waybar";     }
        Mod+Escape    { spawn "lockScreenMadeByMe";         }
        Mod+Space     { spawn "alMenuMadeByMe";             }

        XF86AudioRaiseVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.01+";  }
        XF86AudioLowerVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.01-";  }
        XF86AudioMute        { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";   }
        XF86AudioMicMute     { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }

        XF86MonBrightnessUp   { spawn "brightnessctl" "s" "+10%"; }
        XF86MonBrightnessDown { spawn "brightnessctl" "s" "10%-"; }

        XF86AudioMedia { spawn "playerctl" "play-pause"; }
        XF86AudioPlay  { spawn "playerctl" "play-pause"; }
        XF86AudioPrev  { spawn "playerctl" "previous";   }
        XF86AudioNext  { spawn "playerctl" "next";       }

        Print      { screenshot;        }
        Ctrl+Print { screenshot-screen; }
        Alt+Print  { screenshot-window; }

        Mod+Minus       { set-column-width  "-10%"; }
        Mod+Equal       { set-column-width  "+10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }
        Mod+Shift+Minus { set-window-height "-10%"; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }

        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }
        Mod+Shift+6 { move-column-to-workspace 6; }
        Mod+Shift+7 { move-column-to-workspace 7; }
        Mod+Shift+8 { move-column-to-workspace 8; }
        Mod+Shift+9 { move-column-to-workspace 9; }

        Mod+A { focus-column-left;              }
        Mod+W { focus-window-or-workspace-down; }
        Mod+S { focus-window-or-workspace-up;   }
        Mod+D { focus-column-right;             }

        Mod+Ctrl+A { move-column-left;                      }
        Mod+Ctrl+W { move-window-down-or-to-workspace-down; }
        Mod+Ctrl+S { move-window-up-or-to-workspace-up;     }
        Mod+Ctrl+D { move-column-right;                     }

        Mod+Shift+A { focus-monitor-left;  }
        Mod+Shift+W { focus-monitor-down;  }
        Mod+Shift+S { focus-monitor-up;    }
        Mod+Shift+D { focus-monitor-right; }

        Mod+Ctrl+Shift+A { move-column-to-monitor-left;  }
        Mod+Ctrl+Shift+W { move-column-to-monitor-down;  }
        Mod+Ctrl+Shift+S { move-column-to-monitor-up;    }
        Mod+Ctrl+Shift+D { move-column-to-monitor-right; }

        Mod+WheelScrollDown       cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollUp         cooldown-ms=150 { focus-workspace-up;   }
        Mod+Shift+WheelScrollDown cooldown-ms=150 { focus-column-right;   }
        Mod+Shift+WheelScrollUp   cooldown-ms=150 { focus-column-left;    }

        Mod+MouseForward { focus-column-right;            }
        Mod+MouseBack    { focus-column-left;             }

        Mod+BracketLeft  { consume-or-expel-window-left;  }
        Mod+BracketRight { consume-or-expel-window-right; }

        Mod+Comma        { consume-window-into-column;    }
        Mod+Period       { expel-window-from-column;      }
    }

  '';

  home.file.".config/niri/colors.kdl".text = ''
        layout {
        focus-ring {
            active-color   "#89B4FA"
            inactive-color "#7F849C"
            urgent-color   "#F38BA8"
        }

        border {
            active-color   "#89B4FA"
            inactive-color "#7F849C"
            urgent-color   "#F38BA8"
        }

        shadow {
            color "#00000070"
        }

        tab-indicator {
            active-color   "#89B4FA"
            inactive-color "#7F849C"
            urgent-color   "#F38BA8"
        }

        insert-hint {
            color "#89B4FA80"
        }
    }
  '';

  home.packages = with pkgs; [
    xwayland-satellite # needed for niri, its how niri manages x11
  ];

}
