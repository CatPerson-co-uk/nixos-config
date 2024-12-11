{ config, pkgs, ... }:
{
  home = {
    username = "catperson";
    homeDirectory = "/home/catperson";
    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;
    
    shell = import ./shell/shell.nix { inherit config pkgs; };

    git = {
      enable = true;
    };
  };
}
