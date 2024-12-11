{config, pkgs, lib, ...}:

let
  scripts = pkgs.stdenv.mkDerivation {
    name = "eww-scripts";
    src = ./eww/scripts;
    installPhase = ''
      mkdir -p $out/bin
      cp * $out/bin/
      chmod +x $out/bin/*
    '';
  };
in
{
  home.packages = with pkgs; [
    eww
    pamixer # For volume control
    brightnessctl # For brightness control
    jq # For JSON parsing
    socat # For socket communication
    networkmanager # For network info
    i3lock # For screen locking
    playerctl # For media controls
    bluez # For bluetooth management
    xdotool # For window title
    acpi # For battery info
    scripts # Our custom scripts
  ];

  # Create eww config directory and copy configuration files
  xdg.configFile = {
    "eww/eww.scss".source = ./eww/eww.scss;
    "eww/eww.yuck".source = ./eww/eww.yuck;
    "eww/scripts" = {
      source = ./eww/scripts;
      recursive = true;
      executable = true;
    };
  };

  # Ensure eww daemon is started with the session
  systemd.user.services.eww = {
    Unit = {
      Description = "Eww Daemon";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.eww}/bin/eww daemon --no-daemonize";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
} 