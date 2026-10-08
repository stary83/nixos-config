# https://wiki.nixos.org/wiki/SearXNG
{ pkgs, ... }: 
{
  services = {
    searx = {
      enable = true;
      redisCreateLocally = true;
      settings = {
        server = {
          port = 8081;
          bind_address = "127.0.0.1";
          secret_key = "key";
        };
      };
    };
  };

}
