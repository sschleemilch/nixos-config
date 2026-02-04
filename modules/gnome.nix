{ ... }: {
  services = {
    displayManager = {
      gdm.enable = true;
      autoLogin = {
        enable = true;
        user = "basti";
      };
    };

    desktopManager.gnome.enable = true;
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}
