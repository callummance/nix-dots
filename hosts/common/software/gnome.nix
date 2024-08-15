{
  pkgs,
  input,
  ...
}: {
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [gnomeExtensions.appindicator];
  services.dbus.packages = with pkgs; [gnome2.GConf];
  services.udev.packages = with pkgs; [gnome.gnome-settings-daemon];
}
