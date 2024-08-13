{
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
}
