{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.systemd-boot.configurationLimit = 3;
    loader.efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "deimos";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
    useXkbConfig = false;
  };

  users.users = {
    basti = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      shell = pkgs.zsh;
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      basti = import ./home.nix;
    };
  };

  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.config.allowUnfree = true;

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  security = {
    pam.services.hyprlock = { };
    rtkit.enable = true;
  };

  services = {
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
      wireplumber.enable = true;
    };
    xserver.videoDrivers = [ "nvidia" ];
    udisks2.enable = true;
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [ "FiraCode" "JetBrainsMono" "Monaspace" ];
    })
  ];

  hardware = {
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
    };
    graphics.enable = true;
  };

  system.stateVersion = "23.11";
}
