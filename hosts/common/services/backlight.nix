{pkgs, ...}: {
  hardware.brillo.enable = true;

  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    gammastep
    brightnessctl
  ];
}
