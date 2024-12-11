{ config, pkgs, ... }:

{
    imports =[
        ./firefox.nix
        ./discord.nix
        ./term/term.nix
        ./shell/shell.nix
        ./steam.nix
        ./spotify.nix
    ]
}