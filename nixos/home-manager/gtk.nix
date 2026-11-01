{ pkgs, ... }: {

  home.packages = with pkgs; [
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };

    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };

    gtk4.theme = null;
    
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

}
