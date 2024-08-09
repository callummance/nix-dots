{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    neovim
    nano
    zoxide
    just
  ];
}
