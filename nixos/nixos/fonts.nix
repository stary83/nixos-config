{ pkgs, ... }:
let
  pixelonFont = pkgs.stdenvNoCC.mkDerivation {
    pname = "pixelon-font";
    version = "1.0";

    src = pkgs.fetchurl {
      url = "https://st.1001fonts.net/download/font/pixelon.regular.ttf";
      hash = "sha256-1cikguPyBE6DXcFzAHsXwu7F//0IEuv1XGfI3o0+YXs=";
    };

    dontUnpack = true;

    installPhase = ''
      mkdir -p "$out/share/fonts/truetype"

      install -m 0644 "$src" \
        "$out/share/fonts/truetype/Pixelon-Regular.ttf"
    '';

    meta = {
      description = "Pixelon pixel-style font";
      license = pkgs.lib.licenses.unfree;
      platforms = pkgs.lib.platforms.all;
    };
  };

in
{

  fonts = {
    fontDir.enable = true; # Ensures /run/current-system/sw/share/X11/fonts exists
    packages =
      (with pkgs; [
        corefonts
        nerd-fonts.jetbrains-mono
        roboto
        source-sans
        font-awesome
        openmoji-color
      ])
      ++ [
        pixelonFont
      ];
  };

}
