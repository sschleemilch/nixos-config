{ pkgs, ... }:
{
  programs.niri.enable = true;

  services = {
    upower.enable = true;
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "niri-session";
          user = "basti";
        };
        default_session = initial_session;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    swaybg
    mako
    nwg-look
    nautilus
    hyprlock
    quickshell
    dgop
    fuzzel
    brightnessctl
    cliphist
  ];
}
