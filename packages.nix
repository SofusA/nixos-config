{ config, pkgs, lib, ... }:
{
    # Docker
    virtualisation.docker.enable = true;
    #virtualisation.libvirtd.enable = true;

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
        # evince
        # gnome3.eog
        # gnome3.totem
        # gnome3.gnome-tweak-tool

        # Games and stuff
        steam
        discord
        xboxdrv
        multimc
        signal-desktop
        # lutris
        # mesa
        # vulkan-loader
        # vulkan-headers
        # vulkan-validation-layers
        # vulkan-tools
        amdvlk
        protontricks

        # Office stuff
        # slack
        # simplenote
        libreoffice
        nextcloud-client
        teams
        #gnome3.gnome-calendar

        # Development
        vscodium
        git
        # python38Full
        # python38Packages.pillow
        # python38Packages.pip
        # nodejs

        # Virtualisation
        #gnome3.gnome-boxes
        #virt-manager

        # Disk utilities
        parted
        gparted
        #etcher
        #woeusb
        xorg.xhost
        gnome3.gnome-disk-utility
        #hfsprogs #måske ligegyldig mac hfs pakke
        udiskie
    ];

    # Dotfiles
    environment = {
      etc = {
        "ranger".source = ./dotfiles/ranger;
      };
    };

    home-manager.users.sofusa = {
        xdg.configFile = {
            "kak".source = ./dotfiles/kak;
            "kitty".source = ./dotfiles/kitty;
            #"ranger".source = ./dotfiles/ranger;
        };
        gtk = {
            enable = true;

            iconTheme = {
                name = "Papirus";
                package = pkgs.papirus-icon-theme;
            };
            
            theme = {
                name = "Adwaita-dark";
                package = pkgs.gnome3.adwaita-icon-theme;
            };

            font = {
                package = pkgs.roboto;
                name = "Roboto 11";
            };
        };
    };

}
