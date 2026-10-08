{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      dwmbar = prev.stdenv.mkDerivation rec {
        pname = "dwmbar";
        version = "1.2.0";

        src = prev.fetchFromGitHub {
          owner = "thytom";
          repo = "dwmbar";
          rev = "3a372a084a2eb515de6c6d35c3b7ff29d5a46c24";
          sha256 = "sha256-OzHsXJrCK7T1u1/hJ3ZADwqgaLCpFcMaIZYWywJiiJw=";
        };

        nativeBuildInputs = with pkgs; [
          bash coreutils gawk gnugrep jq
          xsetroot wireplumber mpc iputils wget
        ];

        dontBuild = true;

        postPatch = ''
          substituteInPlace dwmbar \
            --replace 'DEFAULT_CONFIG_DIR="/usr/share/dwmbar"' "DEFAULT_CONFIG_DIR=\"$out/share/dwmbar\""
        '';

        installPhase = ''
          install -d $out/share/dwmbar
          install -d $out/share/dwmbar/modules
          install -d $out/share/dwmbar/lib
          cp -r modules/* $out/share/dwmbar/modules/
          cp -r lib/* $out/share/dwmbar/lib/
          install -D -t $out/share/dwmbar/ config bar.sh
          install -Dm755 -t $out/share/dwmbar/ config-sync.sh
          install -Dm755 -t $out/bin/ dwmbar
        '';

        meta = with prev.lib; {
          homepage = "https://github.com/thytom/dwmbar";
          description = "Modular Status Bar for dwm";
          license = licenses.gpl3Plus;
          maintainers = with maintainers; [ baitinq ];
          platforms = platforms.linux;
          mainProgram = "dwmbar";
        };
      };
    })
  ];

  environment.systemPackages = with pkgs; [
    dwmbar
  ];
}