{ ... }:

{
  security.rtkit.enable = true;
  security = {
    pki = {};
    polkit = {
      enable = true;
    };
  };

}
