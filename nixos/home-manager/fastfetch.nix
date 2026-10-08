{ pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
  };
  home.file.".config/fastfetch".source = ../resources/dots/fastfetch;
}
