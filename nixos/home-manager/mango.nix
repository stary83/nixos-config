{ config, pkgs, ... }:

{
  imports = [
    # ./utilitys/swayidle.nix
    ./utilitys/mako.nix
    ./utilitys/waybar.nix
    ./utilitys/mangobar.nix
    ./utilitys/authentication-agent.nix
    ./utilitys/lockScreenMadeByMe.nix
    ./utilitys/applauncherMenuMadeByMe.nix
  ];

  home.file.".config/mango/config.conf".text = ''
    source=./colors.conf

    ###############################################################################
    # Environment
    ###############################################################################

    # Do not hard-code DISPLAY=:0. Mango/XWayland manages DISPLAY for its session.
    env=TERMINAL,ghostty
    env=TERM,ghostty
    env=XCURSOR_SIZE,18
    env=XDG_CURRENT_DESKTOP,mango
    env=XDG_SESSION_DESKTOP,mango
    env=XDG_SESSION_TYPE,wayland
    env=DESKTOP_SESSION,mango
    env=MOZ_ENABLE_WAYLAND,1
    env=ELECTRON_OZONE_PLATFORM_HINT,wayland
    env=BEMENU_BACKEND,wayland
    env=CLUTTER_BACKEND,wayland
    env=SDL_VIDEODRIVER,wayland
    env=QT_QPA_PLATFORM,wayland;xcb
    env=QT_QPA_PLATFORMTHEME,qt6ct
    env=QT_WAYLAND_DISABLE_WINDOWDECORATION,1
    env=QT_SCALE_FACTOR,1
    env=QT_AUTO_SCREEN_SCALE_FACTOR,1
    env=GDK_SCALE,1
    env=GDK_BACKEND,wayland,x11,*
    env=GTK_USE_PORTAL,1
    env=WLR_NO_HARDWARE_CURSORS,1

    ###############################################################################
    # Monitor
    ###############################################################################

    # If Mango cannot match this exact refresh rate, check `wlr-randr` and adjust it.
    monitor_rule=name:^eDP-1$,width:1920,height:1200,refresh:60.002,x:0,y:0,scale:1.4,rr:0

    ###############################################################################
    # Keyboard, touchpad, and mouse
    ###############################################################################

    xkb_rules_model=pc105
    xkb_rules_layout=us,ir
    xkb_rules_variant=,
    xkb_rules_options=grp:alt_space_toggle
    repeat_delay=300
    repeat_rate=30
    numlock_on=1

    disable_trackpad=0
    tap_to_click=1
    tap_and_drag=1
    drag_lock=1
    trackpad_natural_scrolling=1
    trackpad_accel_profile=1
    trackpad_accel_speed=0.0
    trackpad_scroll_method=1
    trackpad_middle_button_emulation=1
    trackpad_disable_while_typing=0

    mouse_accel_profile=1
    mouse_accel_speed=0.0
    mouse_natural_scrolling=0
    mouse_middle_button_emulation=1

    ###############################################################################
    # Animations
    ###############################################################################

    animations=1
    layer_animations=1

    animation_type_open=slide
    animation_type_close=slide
    animation_fade_in=1
    animation_fade_out=1

    # Vertical workspace transitions rather than horizontal ones.
    tag_animation_direction=0

    # Slightly longer transitions with smoother easing.
    animation_duration_move=360
    animation_duration_open=300
    animation_duration_tag=420
    animation_duration_close=260
    animation_duration_focus=140

    # Smooth ease-out transitions.
    animation_curve_move=0.22,1.0,0.36,1.0
    animation_curve_open=0.16,1.0,0.3,1.0
    animation_curve_tag=0.22,1.0,0.36,1.0
    animation_curve_close=0.4,0.0,1.0,1.0
    animation_curve_focus=0.22,1.0,0.36,1.0

    ###############################################################################
    # Scroller layout, gaps, borders, colours
    ###############################################################################

    scroller_default_proportion=0.9
    scroller_default_proportion_single=0.9
    scroller_ignore_proportion_single=0
    scroller_focus_center=0
    scroller_prefer_center=0
    scroller_prefer_overspread=0
    scroller_proportion_preset=0.33333,0.5,0.66667,0.9

    # one-key equivalent in Mango's documented tag-mask interface.
    tag_num=9
    smart_gaps=0
    no_border_when_single=0

    gap_inner_horizontal=6
    gap_inner_vertical=6
    gap_outer_horizontal=6
    gap_outer_vertical=6

    shadows=0
    layer_shadows=0

    # Rounded window corners, matching Niri's radius of 5.
    border_radius=5
    no_radius_when_single=0

    cursor_size=24
    cursor_hide_timeout=10
    cursor_hide_on_keypress=1
    warp_cursor=0
    sloppy_focus=0
    focus_on_activate=0
    drag_warp_cursor=0
    drag_tile_to_tile=1

    tag_rule=id:1,no_hide:1,layout_name:scroller
    tag_rule=id:2,no_hide:1,layout_name:scroller
    tag_rule=id:3,no_hide:1,layout_name:scroller
    tag_rule=id:4,no_hide:1,layout_name:scroller
    tag_rule=id:5,no_hide:1,layout_name:scroller
    tag_rule=id:6,no_hide:1,layout_name:scroller
    tag_rule=id:7,no_hide:1,layout_name:scroller
    tag_rule=id:8,no_hide:1,layout_name:scroller
    tag_rule=id:9,no_hide:1,layout_name:scroller

    ###############################################################################
    # Startup applications
    ###############################################################################

    exec_once=awww-daemon
    exec_once=mako
    # exec_once=waybar
    exec_once=mangobar
    exec_once=awww img --transition-type center "$HOME/.current_wallpaper"

    ###############################################################################
    # Window rules
    ###############################################################################

    # window_rule=no_border:1,no_shadow:1,no_radius:1,app_id:^(foot|footclient)$

    window_rule=is_floating:1,title:^Steam Settings$
    window_rule=is_floating:1,app_id:^galculator$
    window_rule=is_floating:1,app_id:^blueberry.*$
    window_rule=is_floating:1,app_id:^nm-connection-editor$
    window_rule=is_floating:1,app_id:^org\.kde\.polkit-kde-authentication-agent-1$
    window_rule=is_floating:1,app_id:^polkit-gnome-authentication-agent-1$
    window_rule=is_floating:1,title:^gtk.*$
    window_rule=is_floating:1,app_id:^GParted$
    window_rule=is_floating:1,app_id:^nwg-look$
    window_rule=is_floating:1,app_id:^qt6ct$
    window_rule=is_floating:1,app_id:^qt5ct$
    window_rule=is_floating:1,app_id:^org\.pulseaudio\.pavucontrol$
    window_rule=is_floating:1,title:^popup title with spaces$
    window_rule=is_floating:1,title:.*Picture-in-Picture.*

    window_rule=is_fullscreen:1,app_id:^Minecraft$

    ###############################################################################
    # Keybindings
    ###############################################################################

    key_mode=common
    bind=SUPER+SHIFT,r,reload_config

    key_mode=default

    # Main controls
    bind=SUPER+SHIFT,slash,togglejump
    bind=SUPER,Tab,toggleoverview
    bind=SUPER,q,killclient
    bind=SUPER+SHIFT,q,quit
    bind=ALT,F4,killclient
    bind=SUPER+CTRL,f,togglefloating
    bind=SUPER+SHIFT,f,togglefullscreen
    bind=NONE,F11,togglefullscreen
    bind=SUPER,Return,togglemaximizescreen
    bind=SUPER+ALT,c,centerwin
    bind=SUPER+ALT,f,focuslast

    # Applications / custom scripts
    bind=SUPER,t,spawn,ghostty
    bind=SUPER,space,spawn,alMenuMadeByMe
    bind=SUPER,Escape,spawn,lockScreenMadeByMe
    bind=CTRL+ALT,w,spawn_shell,pkill -x mangobar; mangobar

    # Audio
    bind=NONE,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+
    bind=NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-
    bind=NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bind=NONE,XF86AudioMicMute,spawn,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

    # Brightness
    bind=NONE,XF86MonBrightnessUp,spawn,brightnessctl s +10%
    bind=NONE,XF86MonBrightnessDown,spawn,brightnessctl s 10%-

    # Media playback
    # bind=NONE,XF86AudioMedia,spawn,playerctl play-pause
    # bind=NONE,XF86AudioPlay,spawn,playerctl play-pause
    # bind=NONE,XF86AudioPrev,spawn,playerctl previous
    # bind=NONE,XF86AudioNext,spawn,playerctl next

    # Screenshots. Print = entire layout; Ctrl+Print = laptop display;
    # Alt+Print = select a region (a close practical substitute for Niri's window shot).
    # Requires grim and slurp in the system/user packages.
    bind=NONE,Print,spawn_shell,mkdir -p "$HOME/Pictures/Screenshots" && grim "$HOME/Pictures/Screenshots/$(date +%F_%H-%M-%S).png"
    bind=CTRL,Print,spawn_shell,mkdir -p "$HOME/Pictures/Screenshots" && grim -o eDP-1 "$HOME/Pictures/Screenshots/$(date +%F_%H-%M-%S).png"
    bind=ALT,Print,spawn_shell,mkdir -p "$HOME/Pictures/Screenshots" && grim -g "$(slurp)" "$HOME/Pictures/Screenshots/$(date +%F_%H-%M-%S).png"

    # Scroller width presets. Mango sets a proportion directly; it does not provide
    # the same relative +/-10% column-width operation as Niri.
    bind=SUPER,minus,set_proportion,0.66667
    bind=SUPER,equal,set_proportion,0.9
    # Niri's Super+Shift+Minus/Equal window-height increments have no direct
    # equivalent in Mango's scroller layout, so those bindings are left unused.
    bind=SUPER,1,view,1,0
    bind=SUPER,2,view,2,0
    bind=SUPER,3,view,3,0
    bind=SUPER,4,view,4,0
    bind=SUPER,5,view,5,0
    bind=SUPER,6,view,6,0
    bind=SUPER,7,view,7,0
    bind=SUPER,8,view,8,0
    bind=SUPER,9,view,9,0

    bind=SUPER+SHIFT,1,tag,1,0
    bind=SUPER+SHIFT,2,tag,2,0
    bind=SUPER+SHIFT,3,tag,3,0
    bind=SUPER+SHIFT,4,tag,4,0
    bind=SUPER+SHIFT,5,tag,5,0
    bind=SUPER+SHIFT,6,tag,6,0
    bind=SUPER+SHIFT,7,tag,7,0
    bind=SUPER+SHIFT,8,tag,8,0
    bind=SUPER+SHIFT,9,tag,9,0

    bind=SUPER,a,focusdir,left
    bind=SUPER,w,focus_window_or_workspace,down
    bind=SUPER,s,focus_window_or_workspace,up
    bind=SUPER,d,focusdir,right

    # Move / reorder windows.
    bind=SUPER+CTRL,a,move_client,left
    # bind=SUPER+CTRL,w,move_client,up
    # bind=SUPER+CTRL,s,move_client,down
    bind=SUPER+CTRL,d,move_client,right

    # Move the focused window to the next/previous workspace.
    bind=SUPER+CTRL,w,tagtoright
    bind=SUPER+CTRL,s,tagtoleft

    # Focus monitors.
    bind=SUPER+SHIFT,a,focusmon,left
    bind=SUPER+SHIFT,w,focusmon,down
    bind=SUPER+SHIFT,s,focusmon,up
    bind=SUPER+SHIFT,d,focusmon,right

    # Move focused window to another monitor while keeping its tag.
    bind=SUPER+CTRL+SHIFT,a,tagmon,left,1
    bind=SUPER+CTRL+SHIFT,w,tagmon,down,1
    bind=SUPER+CTRL+SHIFT,s,tagmon,up,1
    bind=SUPER+CTRL+SHIFT,d,tagmon,right,1

    axisbind=SUPER,UP,viewtoleft_have_client
    axisbind=SUPER,DOWN,viewtoright_have_client
    axisbind=SUPER+SHIFT,UP,focusdir,left
    axisbind=SUPER+SHIFT,DOWN,focusdir,right

    mousebind=SUPER,btn_back,focusdir,left
    mousebind=SUPER,btn_forward,focusdir,righ
    mousebind=SUPER,btn_left,moveresize,curmove
    mousebind=SUPER,btn_right,moveresize,curresize

    bind=SUPER,bracketleft,scroller_stack,left
    bind=SUPER,bracketright,scroller_stack,right
    bind=SUPER,comma,groupjoin,left
    bind=SUPER+SHIFT,comma,groupjoin,right
    bind=SUPER,period,groupleave

    gesturebind=none,left,3,focusdir,left
    gesturebind=none,right,3,focusdir,right
    gesturebind=none,up,3,focusdir,up
    gesturebind=none,down,3,focusdir,down
    gesturebind=none,left,4,viewtoleft_have_client
    gesturebind=none,right,4,viewtoright_have_client
    gesturebind=none,up,4,enteroverview
    gesturebind=none,down,4,leaveoverview
  '';

  home.file.".config/mango/colors.conf".text = ''
    # Catppuccin Mocha colors: background, muted, blue, green, red.
    root_color=0x1e1e2eff
    border_px=2
    focus_color=0x89b4faff
    border_color=0x7f849cff
    urgent_color=0xf38ba8ff
    maximized_screen_color=0xa6e3a1ff
    split_color=0x89b4faff
    drop_color=0x00000070
  '';

  home.packages = with pkgs; [

  ];

}
