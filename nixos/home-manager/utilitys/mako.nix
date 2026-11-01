{ ... }:

{
  services.mako = {
    enable = true;

    settings = {
      # Catppuccin Mocha — aligned with the Fuzzel / Waybar palette.
      background-color = "#1E1E2EDD";
      text-color = "#CDD6F4FF";
      border-color = "#89B4FAFF";
      progress-color = "over #89B4FAFF";

      # Layout
      anchor = "top-right";
      layer = "top";
      width = 360;
      height = 120;
      margin = 10;
      padding = 12;
      border-size = 2;
      border-radius = 10;
      max-visible = 5;

      # Typography and content
      font = "FiraCode Nerd Font 11";
      markup = true;
      format = "<b>%s</b>\\n%b";
      icons = true;
      max-icon-size = 48;
      actions = true;

      # Notification lifetime (milliseconds)
      default-timeout = 5000;
      ignore-timeout = false;

      # Catppuccin urgency accents
      "urgency=low" = {
        border-color = "#A6E3A1FF";
        default-timeout = 4000;
      };
      "urgency=normal" = {
        border-color = "#89B4FAFF";
        default-timeout = 5000;
      };
      "urgency=critical" = {
        border-color = "#F38BA8FF";
        default-timeout = 0;
      };

    };
    extraConfig = ''
      [app-name="Google Chrome"]
      border-color=#89B4FAFF
      default-timeout=5000
      ignore-timeout=true
    '';
  };
}
