{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    networking.hostName = "nightDesk"; 
    services.getty.autologinUser = "jctannu4";
    networking.networkmanager.enable = true;

    time.timeZone = "America/New_york";

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    users.users.jctannu4 = {
        isNormalUser = true;
        extraGroups = [ "wheel"];
        packages = with pkgs; [
        tree
        ];
    };
	fileSystems = {
  		"/".options = [ "compress=zstd" ];
  		"/home".options = [ "compress=zstd" ];
 		"/nix".options = [ "compress=zstd" "noatime" ];
  		"/swap".options = [ "noatime" ];
	};

	services.btrfs.autoScrub = {
  		enable = true;
  		interval = "monthly";
  		fileSystems = [ "/" ];
	};

   services.openssh.enable = true ; 
    programs.firefox.enable = true;
    environment.systemPackages = with pkgs; [
		gcc
		vim
        wget
        curl
        alacritty
        waybar
		neovim
    ];  
 	fonts.packages = with pkgs; [
    	nerd-fonts.jetbrains-mono
 	 ];
	
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "26.05"; 

}

