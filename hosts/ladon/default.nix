{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
  ];

  networking.hostName = "ladon";

  services = {
    fprintd.enable = true;
    tuned.enable = true;
    upower.enable = true;
  };

  hardware.bluetooth.enable = true;
}
