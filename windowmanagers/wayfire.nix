{ config, lib, pkgs, ... }:
let
  rev = "master"; # could be a git rev, to pin the overlay (not usually recommended)
  url = "https://github.com/colemickens/nixpkgs-wayland/archive/${rev}.tar.gz";
  waylandOverlay = (import (builtins.fetchTarball url));
in
  {
    nixpkgs.config.permittedInsecurePackages = [
      "p7zip-16.02"
    ];

    nixpkgs.overlays = [ waylandOverlay ];
    environment.systemPackages = with pkgs; [
    	wayfire 
    ];
    
    home-manager.users.sofusa = {
    	xdg.configFile."wayfire.ini".source = ./wayfire.ini;
    };
  }
