{ pkgs, ... }:

{ 
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ../resources/wallpaper/pastel-forest.png;
    targets = {
      # gnome.enable = true;
      nixos-icons.enable = true;
    };
  };
}

