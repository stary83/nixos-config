{ pkgs, ... }:
{
  services.swayidle = {
    enable = true;

    # Start with Niri and stop when its session ends.
    systemdTargets = [ "niri.service" ];

    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
      }
    ];
  };
}