{pkgs, ...}: {
  services = {
    dbus.packages = [
      pkgs.gcr
      pkgs.gnome.gnome-settings-daemon
    ];

    gnome.gnome-keyring.enable = true;

    gvfs.enable = true;
  };
}
