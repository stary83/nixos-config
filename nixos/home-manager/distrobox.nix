{ pkgs, ... }:

{
  programs.distrobox = {
    enable = true;
  };
  home.file.".distroboxrc".text = ''
    container_manager="docker"
    xhost +si:localuser:$USER >/dev/null
  '';

}
