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
    gnome.dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "'prefer-dark'";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    swaybg
    waybar
    mako
    nwg-look
    nautilus
    fuzzel
    hyprlock
  ];
}
