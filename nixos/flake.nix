{
  description = "Nixos config flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.home-manager.follows = "home-manager";
    };

    awww.url = "git+https://codeberg.org/LGFae/awww";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-index-database.follows = "nix-index-database";
    };

    # proxy client
    zedsecure = {
      url = "github:CluvexStudio/ZedSecure";
    };

    yazi.url = "github:sxyazi/yazi";

    # ------ disbaled modules ------
    #
    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    # };
    #
    #
    # nixvim = {
    #  # url = "github:nix-community/nixvim";
    #  # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
    #   url = "github:nix-community/nixvim/nixos-26.05";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    #
    # prismlauncher = {
    #   url = "github:PrismLauncher/PrismLauncher";
    #   # inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    #
    # mangowm = {
    #   url = "github:mangowm/mango";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    #
    # mangobar = {
    #   url = "github:mangowm/mangobar";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # ------------------------------

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      host = "stary";
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        ${host} = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit host;
          };
          modules = [

            home-manager.nixosModules.home-manager
            {
              home-manager.backupFileExtension = "bkp";
              home-manager.users.${host} = import ./hosts/${host}/home.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                inherit pkgs;
                inherit host;
              };
            }

            {
              nix.settings.experimental-features = [
                "nix-command"
                "flakes"
              ];
            }

            inputs.stylix.nixosModules.stylix
            ./hosts/${host}/configuration.nix

          ];
        };
      };
    };
}
