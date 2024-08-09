
default:
    @just --list

rebuild-pre:
    git add *.nix

rebuild:
    just rebuild-pre
    ./scripts/flake-rebuild.sh

update:
    nix flake update

rebuild-update:
    just update
    just rebuild