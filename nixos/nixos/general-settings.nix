{ pkgs, ... }:
{

  # Set your time zone.
  time.timeZone = "Asia/Tehran";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  environment = {
    # set during boot ( before login )
    variables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "nvim";

      TERMINAL = "ghostty";
      TERM = "ghostty";

    };

    # set during session init ( after login )
    sessionVariables = {
      XKB_DEFAULT_LAYOUT = "us,ir";
      XKB_DEFAULT_MODEL = "pc105";
      XKB_DEFAULT_VARIANT = ",";
      XKB_DEFAULT_OPTIONS = "grp:alt_space_toggle";
    };
  };

}
