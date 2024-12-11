{config, pkgs, lib, ...}:

{
  home.packages = with pkgs; [
    # Monospace fonts
    nerd-fonts.jetbrains-mono
    jetbrains-mono

    # Icon fonts
    font-awesome
    material-design-icons

    # System fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  fonts.fontconfig.enable = true;

  # Font configuration
  xdg.configFile."fontconfig/conf.d/10-nerd-font-symbols.conf".text = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <!-- Nerd Fonts Symbol -->
      <alias>
        <family>monospace</family>
        <prefer>
          <family>JetBrainsMono Nerd Font</family>
          <family>Noto Color Emoji</family>
          <family>Font Awesome 6 Free</family>
          <family>Material Design Icons</family>
        </prefer>
      </alias>
    </fontconfig>
  '';
} 