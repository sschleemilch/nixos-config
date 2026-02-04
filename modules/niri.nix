{ pkgs, ... }: {
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
  };

  environment.systemPackages = with pkgs; [
    swaybg
    waybar
    dunst
    nwg-look
    nautilus
    fuzzel
  ];

}
