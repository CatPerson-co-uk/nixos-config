# Zsh configuration
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      share = true;
    };

    initExtra = ''
      # Load starship
      eval "$(starship init zsh)"

      # Enable vi mode
      bindkey -v

      # Better history search
      bindkey '^R' history-incremental-search-backward
      bindkey '^S' history-incremental-search-forward
      bindkey '^P' history-search-backward
      bindkey '^N' history-search-forward

      # Basic auto/tab completion
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit
      _comp_options+=(globdots)


      eval "$(zoxide init zsh)"
    '';

    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      ".." = "cd ..";
      "..." = "cd ../..";
      rebuild = "cd ~/nix-config && sudo nixos-rebuild switch --flake .#nixConfig && read -q \"REPLY?Would you like to reboot now? (y/N) \" && if [[ $REPLY =~ ^[Yy]$ ]]; then sudo reboot; fi";
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
      {
        name = "catppuccin-zsh-syntax-highlighting";
        file = "themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "zsh-syntax-highlighting";
          rev = "99def12ae0e2e720c2f915d5c6ad4858a6937ff9";
          sha256 = "Q7KmwUd9fblprL55W0Sf4g7lRcemnhjh4/v+TacJSfo=";
        };
      }
    ];
  };

  home.packages = with pkgs; [
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
  ];
} 