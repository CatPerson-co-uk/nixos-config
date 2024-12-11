{ config, pkgs, ... }:

{
  programs.kitty = import ./kitty.nix { inherit config pkgs; };
  programs.zsh = import ./zsh.nix { inherit config pkgs; };
  programs.zoxide = import ./zoxide.nix { inherit config pkgs; };
  programs.fzf = import ./fzf.nix { inherit config pkgs; };
}