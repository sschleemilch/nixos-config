{ pkgs, ... }:
{
  programs.niri.enable = true;

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "niri-session";
        user = "basti";
      };
      default_session = initial_session;
    };
    upower.enable = true;
  };

  environment.systemPackages = with pkgs; [
    swaybg
    waybar
    mako
    nwg-look
    nautilus
    fuzzel
    hyprlock
    quickshell
    dgop
  ];
}
