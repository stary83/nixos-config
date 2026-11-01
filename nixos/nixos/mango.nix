# configuration.nix (or any other file that you import)
{ inputs, host, ... }: 
{
  imports = [
    inputs.mangowm.nixosModules.mango
  ];
  programs.mango = {
    enable = true;
  };
  home-manager.users.${host}.imports = [
    ../home-manager/mango.nix
  ];
}