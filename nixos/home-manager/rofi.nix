{ pkgs, ... }:{
  home.packages = with pkgs; [ rofi ];

  # general settings
  home.file.".config/rofi/config.rasi".text = ''
    configuration {
        pid: "/tmp/rofi.pid";
    }
  '';

  #powermenu
  home.file.".config/rofi/powermenu.rasi" = {
    source = ../resources/dots/rofi/power.rasi;
  };

  # launcher
  home.file.".config/rofi/launcher.rasi" = {
    source = ../resources/dots/rofi/launcher.rasi;
  };
  home.file.".config/rofi/shared/font.rasi" = {
    source = ../resources/dots/rofi/shared/fonts.rasi;
  };

  # colors for the configs imported from https://github.com/adi1090x/rofi
  home.file.".config/rofi/shared/colors.rasi" = {
    source = ../resources/dots/rofi/colors/gruvbox.rasi;
  };

}
