{
  pkgs,
  inputs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      #symbols
      material-symbols

      #normal fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      open-sans
      roboto
      dejavu_fonts
      inter
      jost
      alice
      liberation_ttf

      #programming fonts
      monaspace
      jetbrains-mono
      hasklig
      fira

      #nerdfonts
      (nerdfonts.override {fonts = ["Monaspace" "JetBrainsMono" "Hasklig" "FiraCode"];})
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        autohint = true;
        style = "full";
      };
      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };
      defaultFonts = {
        serif = ["Liberation Serif" "Noto Color Emoji"];
        sansSerif = ["Inter Display" "Noto Color Emoji"];
        monospace = ["JetBrains Mono" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };

    fontDir = {
      enable = true;
      decompressFonts = true;
    };
  };
}
