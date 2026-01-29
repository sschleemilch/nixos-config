{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "de";

  security.rtkit.enable = true;

  services = {
    xserver.xkb.layout = "de";
    printing.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    displayManager = {
      cosmic-greeter.enable = true;
      autoLogin = {
        enable = true;
        user = "basti";
      };
    };
    desktopManager.cosmic.enable = true;

    system76-scheduler.enable = true;
  };

  users = {
    defaultUserShell = pkgs.fish;
    users.basti = {
      isNormalUser = true;
      extraGroups = ["wheel"];
    };
  };

  programs = {
    firefox = {
      enable = true;
      preferences = {
        # disable libadwaita theming for Firefox
        "widget.gtk.libadwaita-colors.enabled" = false;
      };
    };
    fish.enable = true;
  };

  nixpkgs.overlays = [
    (import (
      builtins.fetchTarball {
        url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
      }
    ))
  ];

  environment.systemPackages = with pkgs; [
    vim
    npins
    chezmoi
    git
    delta
    direnv
    eza
    fzf
    lazygit
    tmux
    zoxide
    ghostty
    openssh
    starship
    neovim
    ripgrep
    fd
    rustup
  ];
  system.stateVersion = "25.11";
}
