{ config, pkgs, lib, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
      #./windowmanagers/wayfire.nix
      #./windowmanagers/sway.nix
      ./packages.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # System version
  system.stateVersion = "20.03";

  # pipewire stuff
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
      enable = true;
      pulse.enable = true;
  };

  # Network
  networking = {
      hostName = "nixos";
      networkmanager.enable = true;

      useDHCP = false;
      interfaces = {
          enp5s0.useDHCP = true;
          wlp6s0.useDHCP = true;
      };
  };
    
  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Steam suff
  nixpkgs.config.allowUnfree = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  #hardware.pulseaudio.support32Bit = true;
  hardware.steam-hardware.enable = true;
  hardware.opengl.enable = true;

  # Enable sound.
  sound.enable = true;
  #hardware.pulseaudio.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Define a user account
  programs.fish = {
    enable = true;
    shellAliases = {
       #nv = "nvim";
       #vim = "nvim";
    };
  };

  users.users.sofusa = {
     isNormalUser = true;
     shell = pkgs.fish;
     extraGroups = [ "wheel" "networkmanager" "audio" "sway" "docker" ];
   };
  
  environment.variables.EDITOR = "kak";

  # Fonts
  fonts.fonts = with pkgs; [
	  pkgs.font-awesome
	  pkgs.roboto
  ];
}
