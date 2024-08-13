{
  self,
  config,
  pkgs,
  ...
}: let
  commonModules = "${self}/hosts/common";

  inherit (import commonModules) laptop;
in {
  imports = 
    laptop ++ [
      ./hardware-configuration.nix

      "${commonModules}/hardware/graphics.nix"
    ];

  boot = {
    kernelModules = ["kvm-intel"];
    kernelParams = [];
  };

  networking.hostName = "tailred";

  services = {
    fstrim.enable = true;
  };
}
