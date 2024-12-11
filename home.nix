{ config, pkgs, ... }:
{
  home = {
    username = "catperson";
    homeDirectory = "/home/catperson";
    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
    };
  };

  imports = [
    ./apps/apps.nix
    ./modules/desktop/default.nix
  ];
}

