{
  self,
  inputs,
}: let
  inherit (nixpkgs.lib) nixosSystem;
in {
  flake.nixosConfigurations = {
    # Thinkpad T480 laptop
    tailred = nixosSystem {
      specialArgs = {inherit self inputs;};
      modules = [
        ./tailred
      ];
    };
  };
}
