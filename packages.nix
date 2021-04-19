{ config, pkgs, lib, ... }:
{
    # Docker
    #virtualisation.docker.enable = true;
    #virtualisation.libvirtd.enable = true;

    # Services and programs
    programs.geary.enable = true;

    # Packages
    environment.systemPackages = with pkgs; [
      # Terminal and utilities
      kitty
      killall
      pdftk
      p7zip
      ranger
      unzip
      fzf
      kakoune

      # Desktop applications
      gthumb
      gnome3.nautilus
      google-chrome
      firefox-wayland
      evince
      gnome3.eog
      gnome3.totem

      # Games and stuff
      steam
      discord
      xboxdrv
      multimc
      signal-desktop
      lutris
      mesa
      vulkan-loader
      vulkan-headers
      vulkan-validation-layers
      vulkan-tools
      amdvlk
      protontricks
      
      # Office stuff
      slack
      #simplenote
      #libreoffice
      nextcloud-client
      #teams

      # Development
      vscodium
      git
      #python38Full
      #python38Packages.pillow
      #python38Packages.pip
      #nodejs

      # Virtualisation
      #gnome3.gnome-boxes
      #virt-manager

      # Disk utilities
      parted
      gparted
      etcher
      woeusb
      xorg.xhost
      gnome3.gnome-disk-utility
      #hfsprogs #måske ligegyldig mac hfs pakke
      #udiskie
    ];
}
