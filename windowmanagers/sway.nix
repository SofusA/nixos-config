{ config, lib, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swayidle
      xwayland
      waybar
      mako
      swaybg
      wofi
      hicolor-icon-theme

      # Nice stuff
      autotiling
      flashfocus

      # Clipboard
      #wl-clipboard
      #clipman

      # Screenshots
      grim
      slurp

    ];
  };

  # polkit show
  environment.systemPackages = with pkgs; [ polkit_gnome ];
  environment.pathsToLink = [ "/libexec" ];

  # pipewire stuff
  programs.sway.extraSessionCommands = "systemctl --user import-environment";
  security.rtkit.enable = true;
  services.pipewire = {
      enable = true;
      pulse.enable = true;
  };

  # xdg = {
  #     portal = {
  #         enable = true;
  #         extraPortals = with pkgs; [
  #             xdg-desktop-portal-wlr
  #             xdg-desktop-portal-gtk
  #         ];
  #         gtkUsePortal = true;
  #     };
  # };

  # environment.variables = {
  #     MOZ_ENABLE_WAYLAND = "1";
  #     XDG_CURRENT_DESKTOP = "sway";
  #     XDG_SESSION_TYPE = "wayland";
  # };

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
