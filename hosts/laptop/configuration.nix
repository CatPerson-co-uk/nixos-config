{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
  ];

  nixpkgs.overlays = import ../../overlays/example-overlay.nix;

  environment.systemPackages = with pkgs; [
    firefox
    thunderbird
  ];
}
