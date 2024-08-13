let
  base-pc = [
    ./core/default.nix

    ./hardware/fwupd.nix

    ./network/default.nix

    ./software/fonts.nix
    ./software/game-mode.nix
    ./software/home-manager.nix
    ./software/hyprland.nix
    ./software/qt.nix
    ./software/xdg.nix
    ./software/misc.nix
    ./software/zsh.nix

    ./services/audio.nix
    ./services/gnome-services.nix
    ./services/greetd.nix
    ./services/location.nix
    ./services/openssh.nix
    ./services/print.nix
  ];

  desktop = base-pc;

  laptop =
    base-pc
    ++ [
      ./hardware/bluetooth.nix

      ./services/backlight.nix
      ./services/power-laptop.nix
    ];
in {
  inherit base-pc desktop laptop;
}
