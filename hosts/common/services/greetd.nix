{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = [
    pkgs.greetd.tuigreet
  ];

  services.greetd = let
    session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember-session --user-menu --asterisks --cmd Hyprland";
      user = "greeter";
    };
  in {
    enable = true;
    settings = {
      default_session = session;
    };
  };

  # Shamelessly stolen from
  # https://github.com/sjcobb2022/nixos-config/blob/bccd050b7068cf0f05564b4dcb08b80a797ed5b8/hosts/common/optional/greetd.nix
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Prevent error messages over login
    # Prevent kernel messages over login
    TTYReset = true;
    TTYVHangup = true;
    TTYVDisallocate = true;
  };

  # Configure sessions using /etc/greetd/environments file
  environment.etc."greetd/environments".text = ''
    zsh
    hyprland
    ${pkgs.gnome.gnome-shell}/bin/gnome-shell
  '';

  # Unlock gnome keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;
}
