{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  services = {
    upower.enable = true;
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "start-hyprland";
          user = "basti";
        };
        default_session = initial_session;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    hyprlock
    hyprpaper
    hyprpolkitagent
    mako
    nautilus
    quickshell
  ];
}
