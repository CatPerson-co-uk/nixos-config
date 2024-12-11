{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;

    # Theme configuration
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";

    # Enable useful extensions
    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle
      hidePodcasts
      adblock
      playlistIcons
      lastfm
      songStats
    ];

    # Enable custom apps
    enabledCustomApps = with spicePkgs.apps; [
      lyrics-plus
      marketplace
      new-releases
    ];

    # Enable useful snippets
    enabledSnippets = with spicePkgs.snippets; [
      rotating-coverart
      fullScreen
      volumePercentage
    ];

    # Custom settings
    settings = {
      spotify_path = "${config.programs.spotify.package}/share/spotify";
      prefs_path = "${config.home.homeDirectory}/.config/spotify/prefs";
      current_theme = "catppuccin";
      color_scheme = "mocha";
      inject_css = true;
      replace_colors = true;
      overwrite_assets = true;
    };
  };

  # Enable Spotify itself
  programs.spotify = {
    enable = true;
  };
} 