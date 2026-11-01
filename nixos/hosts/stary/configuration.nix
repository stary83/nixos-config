{ pkgs, inputs, ... }:
{
  
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  imports = [
    # ../../nixos/website.nix
    # ../../nixos/nixvim.nix
    # ../../nixos/gnome.nix
    ./hardware-configuration.nix
    ./device-specific.nix
    ../../nixos/graphics.nix
    ../../nixos/boot.nix
    ../../nixos/nix.nix
    ../../nixos/security.nix
    ../../nixos/networking.nix
    ../../nixos/hardware.nix
    ../../nixos/displaymanager.nix
    ../../nixos/programs.nix
    ../../nixos/users.nix
    ../../nixos/services.nix
    ../../nixos/general-settings.nix
    ../../nixos/stylix.nix
    ../../nixos/virtual-machine.nix
    ../../nixos/packages/packages.nix
    ../../nixos/packages/overlaysforpkgsthatarentworking.nix
    ../../nixos/podman.nix
    ../../nixos/docker.nix
    ../../nixos/nix-ld-alien.nix
    ../../nixos/packages/video-photo-editing.nix
    ../../nixos/searxng.nix
    ../../nixos/power.nix
    ../../nixos/fonts.nix

    # --------------------- desktop / sessions -----------------------
    # make sure the required flakes are not commented out
    ../../nixos/niri.nix # niri + waybar
    # ../../nixos/mango.nix # mangowm + mangobar
    # ../../nixos/hyprland.nix
    # --------------------- nixpkgs overlays -------------------------
    # currently most are network related and imported into networking.nix
    # ../../nixos/packages/dwmbar.nix
    # ----------------------------------------------------------------
  ];

  # DO NOT EDIT
  system.stateVersion = "24.11";

}
