{ pkgs, ... }:

{
  programs.distrobox = {
    enable = true;
  };
  home.file.".distroboxrc".text = ''
    xhost +si:localuser:$USER >/dev/null
  '';

}
