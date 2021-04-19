{ config, lib, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    extraSessionCommands = "systemctl --user import-environment";
    extraPackages = with pkgs; [
      # Sway stuff
      swayidle
      xwayland
      waybar
      mako
      swaybg
      wofi
      hicolor-icon-theme
      kanshi

      # Nice tiling stuff
      autotiling
      flashfocus

      # Screenshots
      grim
      slurp

      # Configuration utilities
      pavucontrol

    ];
  };

  # polkit show
  environment.systemPackages = with pkgs; [ polkit_gnome ];
  environment.pathsToLink = [ "/libexec" ];

  # pipewire stuff
  security.rtkit.enable = true;
  services.pipewire = {
      enable = true;
      pulse.enable = true;
  };

  # Bluetooth
  services.blueman.enable = true;

  # Auto log in
  services.getty.autologinUser = "sofusa";
  environment.loginShellInit = ''
  [[ "$(tty)" == /dev/tty1 ]] && sway
      '';

  # Dotfiles
    environment = {
      etc = {
        "sway/config".source = ../dotfiles/sway/config;
        "xdg/alacritty/alacritty.yml".source = ../dotfiles/alacritty/alacritty.yml;
        "ranger/rc.conf".source = ../dotfiles/ranger/rc.conf;
      };
    };

    home-manager.users.sofusa = {
        xdg.configFile = {
            "kak".source = ../dotfiles/kak;
            "waybar".source = ../dotfiles/waybar;
            "wofi".source = ../dotfiles/wofi;
            "kitty".source = ../dotfiles/kitty;
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

  # Screen sharing
  #xdg = {
  #    portal = {
  #        enable = true;
  #        extraPortals = with pkgs; [
  #            xdg-desktop-portal-wlr
  #            xdg-desktop-portal-gtk
  #        ];
  #        gtkUsePortal = true;
  #    };
  #};

  environment.variables = {
      MOZ_ENABLE_WAYLAND = "1";
      XDG_CURRENT_DESKTOP = "sway";
      XDG_SESSION_TYPE = "wayland";
  };

  #environment.systemPackages = with pkgs; [
  #  (
  #    pkgs.writeTextFile {
  #      name = "startsway";
  #      destination = "/bin/startsway";
  #      executable = true;
  #      text = ''
  #        #! ${pkgs.bash}/bin/bash

          # first import environment variables from the login manager
  #        systemctl --user import-environment
          # then start the service
  #        exec systemctl --user start sway.service
  #      '';
  #    }
  #  )
  #];

  #systemd.user.targets.sway-session = {
  #  description = "Sway compositor session";
  #  documentation = [ "man:systemd.special(7)" ];
  #  bindsTo = [ "graphical-session.target" ];
  #  wants = [ "graphical-session-pre.target" ];
  #  after = [ "graphical-session-pre.target" ];
  #};

  #systemd.user.services.sway = {
  #  description = "Sway - Wayland window manager";
  #  documentation = [ "man:sway(5)" ];
  #  bindsTo = [ "graphical-session.target" ];
  #  wants = [ "graphical-session-pre.target" ];
  #  after = [ "graphical-session-pre.target" ];
  #  # We explicitly unset PATH here, as we want it to be set by
  #  # systemctl --user import-environment in startsway
  #  environment.PATH = lib.mkForce null;
  #  serviceConfig = {
  #    Type = "simple";
  #    ExecStart = ''
  #      ${pkgs.dbus}/bin/dbus-run-session ${pkgs.sway}/bin/sway --debug
  #    '';
  #    Restart = "on-failure";
  #    RestartSec = 1;
  #    TimeoutStopSec = 10;
  #  };
  #};
}
