{ pkgs, inputs, ... }:

let
  unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
  
in {
  
  environment.systemPackages = with pkgs; [
    # --- unstable ------------------------------------
    unstable.ghostty
    # -------------------------------------------------

    inputs.prismlauncher.packages.${stdenv.hostPlatform.system}.prismlauncher
    # inputs.matugen.packages.${stdenv.hostPlatform.system}.default
    

    brightnessctl # allows to control brightness
    playerctl # allows for video/audio playback control
    wl-clipboard # clipboard manager
    clipse # clipboard manager
     
    jq # needed for the waybar script
    pavucontrol # audio control
    lua
    protonup-qt
    nuget-to-json
    dotnetCorePackages.sdk_8_0
    gvfs
    udisks2
    usbutils
    vim
    wget
    aria2
    tree
    curl
    vlc
    htop
    ffmpeg
    php
    tmux
    dig
    xhost
    gnome-tweaks 
    nautilus # file manager
    xdg-utils
    google-chrome
    neovim
    yt-dlp
    gnome-keyring
    libsecret
    jdk
    vscode
    alacritty
    libgcc
    gcc
    unrar
    rar
    base16-schemes
    clinfo
    httrack
    freetube
    localsend 
    telegram-desktop
    deluge # torrent client
    python3
    power-profiles-daemon
    nixfmt

    # ------ Bluetooth ------
    overskride
    # blueman
    # bluez
    # -----------------------
  ];

}
