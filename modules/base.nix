{
  nixpkgs.config.allowUnfree = true;
  networking = {
    hostName = "nixos";
    useDHCP = true;
  };

  time.timeZone = "Europe/London";
}