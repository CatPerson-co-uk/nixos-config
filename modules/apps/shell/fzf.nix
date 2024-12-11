# Fzf configuration
{ config, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f --hidden --follow --exclude .git";
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--margin=1"
      "--padding=1"
      # Catppuccin Mocha theme with mauve accent
      "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8"
      "--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc"
      "--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    ];
    changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";
    changeDirWidgetOptions = [
      "--preview 'tree -C {} | head -200'"
    ];
    fileWidgetCommand = "fd --type f --hidden --follow --exclude .git";
    fileWidgetOptions = [
      "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    ];
    historyWidgetOptions = [
      "--sort"
      "--exact"
    ];
  };

  # Configure zoxide to use fzf for interactive selection
  programs.zoxide.options = [
    "--cmd cd"
    "--hook pwd"
  ];

  xdg.configFile."zsh/custom/fzf-zoxide.zsh".text = ''
    # Zoxide with fzf integration
    export _ZO_FZF_OPTS="
      --height 40%
      --layout=reverse
      --border=rounded
      --margin=1
      --padding=1
      --preview 'tree -C {} | head -200'
      --preview-window=right:50%
      --bind='ctrl-o:execute(open {})'
      --bind='ctrl-y:execute(echo {} | pbcopy)'
      --pointer='▶'
      --marker='✓'
      --prompt='❯ '
      --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
      --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#cba6f7
      --color=marker:#cba6f7,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
    "

    # Enhanced zoxide interactive function
    function zf() {
      local dir
      dir="$(zoxide query -l | fzf $FZF_DEFAULT_OPTS $_ZO_FZF_OPTS \
        --preview 'tree -C {} | head -200' \
        --preview-window=right:50% \
        --bind='ctrl-o:execute(open {})' \
        --bind='ctrl-y:execute(echo {} | pbcopy)' \
        --pointer='▶' \
        --marker='✓' \
        --prompt='❯ ' \
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#cba6f7 \
        --color=marker:#cba6f7,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8)"
      if [ -n "$dir" ]; then
        cd "$dir"
      fi
    }
  '';

  home.packages = with pkgs; [
    fzf
    fd  # Better find
    bat # Better cat with syntax highlighting
    tree # Directory visualization
  ];
} 