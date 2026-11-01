{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gruvbox-plus-icons
  ];

  qt = {
    enable = true;

    # Standalone WM integration: configure Qt using qt5ct/qt6ct.
    platformTheme.name = "qtct";

    # Use Kvantum to style Qt widgets.
    style.name = "kvantum";

    # Configure icon themes separately for Qt 5 and Qt 6.
    
    qt5ctSettings = {
      Appearance = {
        icon_theme = "Gruvbox-Plus-Dark";
        style = "kvantum";
      };
    };

    qt6ctSettings = {
      Appearance = {
        icon_theme = "Gruvbox-Plus-Dark";
        style = "kvantum";
      };
    };

    # Install and configure the Kvantum Gruvbox themes.
    kvantum = {
      enable = true;

      themes = [
        pkgs.gruvbox-kvantum
      ];

      settings.General.theme = "Gruvbox-Plus-Dark";
    };
  };
}