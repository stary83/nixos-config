{ pkgs, ... }: {

  home.packages = with pkgs; [
    papirus-folders
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Light-Cursors";
      package = pkgs.catppuccin-cursors.mochaLight;
    };
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Mocha-Light-Cursors";
    package = pkgs.catppuccin-cursors.mochaLight;
    size = 16;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      # gtk-theme = "Breeze-Dark";
      color-scheme = "prefer-dark";
    };
  };
}
