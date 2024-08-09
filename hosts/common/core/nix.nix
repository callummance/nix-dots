{
  config,
  pkgs,
  imports,
  lib,
  ...
}: {
  environment.systemPackages = [
    pkgs.git
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];

      trusted-users = ["root" "@wheel" "@sudo"];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
  };
}
