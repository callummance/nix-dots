{
  self,
  inputs,
  nixpkgs,
  ...
}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  flake.nixosConfigurations = {
    # Thinkpad T480 laptop
    tailred = nixosSystem {
      specialArgs = {inherit self nixpkgs inputs;};
      modules = [
        ./tailred
      ];
    };
  };
}
