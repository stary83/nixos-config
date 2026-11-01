{ pkgs, ... }:
let
  sddm-astronaut =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "hyprland_kath"; # or any other theme
      themeConfig = {
        Font = "pixelon";
        FontSize = "12";
        # HeaderTextColor = "#d5c4a1";
        Background = "Backgrounds/custom-background.mp4";
        HaveFormBackground = "false";
        PartialBlur = "false";
        FullBlur = "false";
        HourFormat = "h:mm AP";
      };
    }).overrideAttrs
      (oldAttrs: {
        # Optional: Inject custom background image
        installPhase = oldAttrs.installPhase + ''
          chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
          install -m 0644 \
            ${../resources/wallpaper/black-hole2.1920x1080.mp4} \
            "$out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/custom-background.mp4"
        '';
      });
in
{

  environment.systemPackages = [
    sddm-astronaut
  ];

  services.displayManager = {
    # gdm.enable = true;

    sddm = {
      enable = true;
      wayland = {
        enable = true;
        compositor = "weston";
      };
      extraPackages = with pkgs; [
        sddm-astronaut
        kdePackages.qtmultimedia # Required for video backgrounds/audio
        kdePackages.qtvirtualkeyboard
      ];
      theme = "sddm-astronaut-theme";
    };

    defaultSession = "niri";
  };

}
