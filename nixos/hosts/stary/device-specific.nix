{ pkgs, ... }:

{
  services.xserver.videoDrivers = [ "intel" "modesetting" ]; 
  hardware.graphics.extraPackages = with pkgs; [
    intel-compute-runtime
    rocmPackages.clr
  ];
  environment.systemPackages = with pkgs; [
    libva-utils          # provides 'vainfo' to verify VA-API works
    intel-media-driver   # releases the VA-API driver for Intel iGPU
    intel-vaapi-driver   # optionally add this for older chips
  ];
}
