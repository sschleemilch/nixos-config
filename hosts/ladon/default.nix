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

  services.fprintd.enable = true;
  services.tuned.enable = true;
  hardware.bluetooth.enable = true;
}
