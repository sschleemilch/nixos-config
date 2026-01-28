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
}
