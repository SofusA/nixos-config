{ config, lib, pkgs, ... }:

{
  
  environment.systemPackages = with pkgs; [ 
    wayfire
    polkit_gnome # polkit show
  ];

  environment.pathsToLink = [ "/libexec" ]; # polkit show

  # pipewire stuff
  security.rtkit.enable = true;
  services.pipewire = {
      enable = true;
      pulse.enable = true;
  };

  # Bluetooth
  services.blueman.enable = true;

  # Auto log in
  # services.getty.autologinUser = "sofusa";
  # environment.loginShellInit = ''
  # [[ "$(tty)" == /dev/tty1 ]] && sway
  #     '';

  # Dotfiles
    environment = {
      etc = {
        "ranger/rc.conf".source = ../dotfiles/ranger/rc.conf;
      };
    };

    home-manager.users.sofusa = {
        xdg.configFile = {
            "kak".source = ../dotfiles/kak;
            "waybar".source = ../dotfiles/waybar;
            "wofi".source = ../dotfiles/wofi;
            "kitty".source = ../dotfiles/kitty;
            "wayfire.ini".source = ./wayfire.ini;
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

  environment.variables = {
      MOZ_ENABLE_WAYLAND = "1";
      XDG_CURRENT_DESKTOP = "sway";
      XDG_SESSION_TYPE = "wayland";
  };
}
