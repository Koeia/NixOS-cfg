{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    networking.hostName = "nixCall"; 
    networking.networkmanager.enable = true;
    hardware.bluetooth.enable = true;
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;

    time.timeZone = "America/New_York";

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    users.users.jctannu4 = {
        isNormalUser = true;
        extraGroups = [ "wheel"];
	shell = pkgs.zsh;
        packages = with pkgs; [
        tree
        ];
    };
<<<<<<< HEAD
    
    services.tailscale.enable = true;

    services.openssh.enable = true; 
=======
	services.tailscale.enable = true;
   services.openssh.enable = true ; 
>>>>>>> 4e8f603841fcc9fcc82aebe962244d184014b9d8
    programs.firefox.enable = true;
    programs.zsh.enable = true;
    
    environment.systemPackages = with pkgs; [
	gcc
	kitty
	git
	vim
        wget
        curl
        alacritty
        waybar
	neovim
	quickshell
	fastfetch
    ];  
 	fonts.packages = with pkgs; [
    	nerd-fonts.jetbrains-mono
 	 ];
	
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "26.05"; 

}

