{...}: {
  environment.pathsToLink = ["/share/zsh"];

  programs = {
    less.enable = true;

    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHightlighting = {
        enable = true;
        patterns = {
          "rm -rf *" = "fg=black,bg=red";
        };
        styles = {
          "alias" = "fg=magenta";
        };
        highlighters = ["main" "brackets" "patterns"];
      };
    };
  };
}
