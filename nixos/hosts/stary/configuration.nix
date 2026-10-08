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
    # --------------------- nixpkgs overlays -------------------------
    # currently most are network related and imported into networking.nix
    # ../../nixos/packages/dwmbar.nix
    # ----------------------------------------------------------------
  ];

  # DO NOT EDIT
  system.stateVersion = "24.11";

}
