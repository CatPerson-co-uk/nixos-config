{ config, pkgs, ... }:

{
  programs.nixcord = {
    enable = true;
    config = {
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-mocha-mauve.theme.css"
      ];
      frameless = true;  
      plugins = {
        alwaysAnimate.enable = true;  
        dearrow.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        openInApp.enable = true;
        relationshipNotifier.enable = true;
        showHiddenChannels.enable = true;
      };
    };
  };
}