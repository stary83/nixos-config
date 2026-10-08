{ pkgs, host, ... }:
{

  users.users.${host} = {
      isNormalUser = true;
      initialPassword = "123456";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
      description = "${host}";
      shell = pkgs.bash;
      packages = with pkgs; [
      ];
  };

}
