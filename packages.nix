{ config, pkgs, lib, ... }:
{
    # Docker
    virtualisation.docker.enable = true;
    virtualisation.libvirtd.enable = true;

    # Services and programs
    programs.geary.enable = true;

    # Packages
    environment.systemPackages = with pkgs; [
      pkgs.steam
      pkgs.pavucontrol
      pkgs.alacritty
      pkgs.kitty
      pkgs.kanshi
      pkgs.discord
      pkgs.slack
      pkgs.simplenote
      pkgs.gthumb
      pkgs.libreoffice
      pkgs.vscodium
      pkgs.killall
      pkgs.xboxdrv
      pkgs.multimc
      pkgs.signal-desktop
      pkgs.nextcloud-client
      #pkgs.pcmanfm
      pkgs.gnome3.nautilus
      pkgs.google-chrome
      pkgs.epiphany
      pkgs.firefox-wayland
      pkgs.evince
      pkgs.gnome3.eog
      pkgs.gnome3.totem
      gnome3.gnome-boxes
      #pkgs.virt-manager
      pkgs.pdftk
      
      pkgs.p7zip

      pkgs.ranger
      pkgs.unzip
      pkgs.fzf
      pkgs.git
      #pkgs.nodejs
      pkgs.kakoune

      pkgs.python38Full
      pkgs.python38Packages.pillow
      #pkgs.python38Packages.pip

      pkgs.lutris
      pkgs.mesa
      pkgs.vulkan-loader
      pkgs.vulkan-headers
      pkgs.vulkan-validation-layers
      pkgs.vulkan-tools
      pkgs.amdvlk
      pkgs.protontricks
      
      #pkgs.webtorrent_desktop

      #pkgs.teams
      pkgs.nodejs

      pkgs.parted
      pkgs.gparted
      pkgs.etcher
      pkgs.woeusb
      pkgs.xorg.xhost
      pkgs.gnome3.gnome-disk-utility
      pkgs.hfsprogs #måske ligegyldig mac hfs pakke
      pkgs.udiskie
    ];
                                                                                                                                            
    
    # Dotfiles
    environment = {
      etc = {
        "sway/config".source = ./dotfiles/sway/config;
        "xdg/alacritty/alacritty.yml".source = ./dotfiles/alacritty/alacritty.yml;
        "ranger/rc.conf".source = ./dotfiles/ranger/rc.conf;
      };
    };

    home-manager.users.sofusa = {
        #xdg.configFile."kak".source = ./dotfiles/kak;
        #xdg.configFile."waybar".source = ./dotfiles/waybar;
        #xdg.configFile."gtk-3.0".source = ./dotfiles/gtk-3.0;
        #xdg.configFile."wofi".source = ./dotfiles/wofi;
        xdg.configFile = {
            "kak".source = ./dotfiles/kak;
            "waybar".source = ./dotfiles/waybar;
            "wofi".source = ./dotfiles/wofi;
            "kitty".source = ./dotfiles/kitty;
        };
        gtk = {
            enable = true;

            iconTheme = {
                name = "Papirus";
                package = pkgs.papirus-icon-theme;
            };
            
            theme = {
                name = "Pop";
                package = pkgs.pop-gtk-theme;
            };

            font = {
                package = pkgs.roboto;
                name = "Roboto 11";
            };
        };
    };
}
