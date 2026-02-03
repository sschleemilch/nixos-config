{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "start-hyprland";
        user = "basti";
      };
      default_session = initial_session;
    };
  };

  environment.systemPackages = with pkgs; [
    swaybg
    hyprshutdown
    hyprpolkitagent
    waybar
    hyprlock
    dunst
    nwg-look
    nautilus
    fuzzel
  ];

}
