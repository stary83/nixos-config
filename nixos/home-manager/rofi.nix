{ pkgs, ... }:

{
  home.packages = with pkgs; [ rofi ];

  home.file.".config/rofi/config.rasi".text = ''
    configuration {
        pid: "/tmp/rofi.pid";
    }
  '';
}
