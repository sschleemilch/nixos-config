{ pkgs, ... }:
{

  imports = [
    ./hyprland.nix
  ];

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
      wireplumber.enable = true;
    };
  };

  users = {
    defaultUserShell = pkgs.fish;
    users.basti = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  programs = {
    firefox.enable = true;
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
    ripgrep
    fd
    rustup
    go
    nodejs_25
    python314
    uv
    neovim
    tree-sitter
    gcc
    stylua
    shfmt
    ty
    ruff
    lua-language-server
    dockerfile-language-server
    gopls
    typescript-language-server
    astro-language-server
    vscode-json-languageserver
    prettier
    yaml-language-server
    ltex-ls-plus
    gotools
    gofumpt
    buf
    marksman
    rust-analyzer
    nixfmt
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.fira-code
  ];

  system.stateVersion = "25.11";
}
