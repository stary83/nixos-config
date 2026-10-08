{ host, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  imports = [
    # ../../home-manager/thunderbird.nix
    # ../../home-manager/hyprland/hyprland.nix
    # ../../home-manager/pass.nix
    # ../../home-manager/gnome.nix
    # ../../home-manager/matugen.nix
    ../../home-manager/utilitys/default.nix
    ../../home-manager/gpg.nix
    ../../home-manager/git.nix
    ../../home-manager/gtk.nix
    ../../home-manager/qt.nix
    ../../home-manager/ghostty.nix
    ../../home-manager/rofi.nix
    ../../home-manager/dunst.nix
    ../../home-manager/fastfetch.nix
    ../../home-manager/obs-studio.nix
    ../../home-manager/gaming.nix
    ../../home-manager/powerMenuMadeByMe.nix
    ../../home-manager/applauncherMenuMadeByMe.nix
    ../../home-manager/niri.nix
    ../../home-manager/distrobox.nix
    ../../home-manager/dns-switcher.nix
    ../../home-manager/waywall.nix
  ];

  home.username = host;
  home.homeDirectory = "/home/${host}";

  # DO NOT EDIT
  home.stateVersion = "25.05"; 

}
