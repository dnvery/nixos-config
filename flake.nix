{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs-dnvery.url = "github:dnvery/nixpkgs";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      # url = "github:nix-community/nixvim/nixos-23.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, nixpkgs-master, nixpkgs-dnvery, home-manager, nixvim, ... }:
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          # To use packages from nixpkgs-stable,
          # we configure some parameters for it first
          pkgs-master = import nixpkgs-master {
            # Refer to the `system` parameter from
            # the outer scope recursively
            inherit system;
          };

          pkgs-stable = import nixpkgs-stable {
            inherit system;
          };

          pkgs-dnvery = import nixpkgs-dnvery {
            inherit system;
          };
        };
        modules = [
          ./configuration.nix
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.daniil = import ./home/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
          nixvim.nixosModules.nixvim
        ];
      };
    };
  };
}
