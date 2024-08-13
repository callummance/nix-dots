{lib, ...}: {
  # Setup networkmanager
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
    wifi.powersave = true;
  };

  services = {
    gnome.glib-networking.enable = true;

    resolved.enable = true;
  };

  # Don't wait for network before starting nm
  systemd.services.NetworkManager-wait-online = {
    enable = lib.mkForce false;
  };
}
