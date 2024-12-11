# Starship configuration with Catppuccin theme
{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      # Use custom format
      format = ''
        [](#a6adc8)$os$username$hostname$directory$git_branch$git_status$git_state$cmd_duration
        [](#a6adc8)$character'';

      # Catppuccin palette
      palette = "catppuccin_mocha";

      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };

      # Configure individual elements
      username = {
        show_always = true;
        style_user = "bold lavender";
        style_root = "bold red";
        format = "[$user]($style) ";
      };

      hostname = {
        ssh_only = false;
        style = "bold green";
        format = "on [$hostname]($style) ";
      };

      directory = {
        style = "bold blue";
        format = "in [$path]($style) ";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
        vicmd_symbol = "[❮](bold green)";
      };

      git_branch = {
        symbol = "";
        style = "bold mauve";
        format = "via [$symbol $branch]($style) ";
      };

      git_status = {
        style = "bold red";
        format = "[$all_status$ahead_behind]($style) ";
      };

      git_state = {
        style = "bold red";
        format = "[$state( $progress_current/$progress_total)]($style) ";
      };

      cmd_duration = {
        min_time = 2000;
        style = "bold yellow";
        format = "took [$duration]($style) ";
      };

      os = {
        disabled = false;
        style = "bold blue";
      };
    };
  };
} 