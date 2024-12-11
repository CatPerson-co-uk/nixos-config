{ config, pkgs, ... }:

{
    imports = [
        ./kitty.nix
        ./zsh.nix
    ];
}