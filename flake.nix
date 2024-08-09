{
  description = "Callum's nix config";

  inputs = let
    ver = "24.05";
  in {
    #Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-${ver}";
    nixpkgs-unsable.url = "github:nixos/nixpkgs/nixos-unstable";

    #Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-${ver}";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Flake-parts
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    #Nix-colors
    nix-colors = {
      url = "github:misterio77/nix-colors";
    };

    #Nix-gaming
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.flake-parts.follows = "flake-parts";
    };
  };

  outputs = {flake-parts, ...} @ inputs: let
    linuxIntelArch = "x86_64-linux";
    linuxArmArch = "aarch64-linux";
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        linuxIntelArch
        linuxArmArch
      ];

      imports = [
        ./hosts
      ];
    };
}
