{pkgs, ...}: {
  hardware.opengl = {
    enable = true;

    extraPackages = with pkgs; [
      libva
      intel-media-sdk
    ];
  };
}
