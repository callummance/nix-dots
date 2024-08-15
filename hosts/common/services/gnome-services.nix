{pkgs, ...}: {
  services = {
    dbus.packages = [
      pkgs.gcr
      pkgs.gnome.gnome-settings-daemon
    ];

    environment.systemPackages = [gnome.adwaita-icon-theme];

    programs.dconf.enable = true;
    gnome.gnome-keyring.enable = true;

    gvfs.enable = true;
  };
}
