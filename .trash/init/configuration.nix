# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{


	programs.zsh.enable = true;

	imports =
		[ # Include the results of the hardware scan.
		./hardware-configuration.nix
		];

# Use the GRUB 2 boot loader.
#boot.loader.grub.enable = true;
#	boot.loader.grub.version = 2;
# boot.loader.grub.efiSupport = true;
# boot.loader.grub.efiInstallAsRemovable = true;
# boot.loader.efi.efiSysMountPoint = "/boot/efi";
# Define on which hard drive you want to install Grub.
#	boot.loader.grub.device = "/dev/sdc"; # or "nodev" for efi only
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

# networking.hostName = "nixos"; # Define your hostname.
#networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Set your time zone.
	time.timeZone = "Europe/Paris";

# The global useDHCP flag is deprecated, therefore explicitly set to false here.
# Per-interface useDHCP will be mandatory in the future, so this generated config
# replicates the default behaviour.
	networking.networkmanager.enable = true;
	networking.networkmanager.wifi.backend= "iwd";
	networking.useDHCP = false;
	networking.interfaces.wlan0.useDHCP = true;
	networking.interfaces.enp1s0.useDHCP = false;

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	console.font = "Lat2-Terminus16";
	console.keyMap = "us";

# Enable the X11 windowing system.


	services.xserver = {
		enable = true;
		desktopManager = {
			xterm.enable = false;
		};

		displayManager =  {
			startx.enable = true;
			defaultSession = "none+i3";
		};
		windowManager.i3 = {
			enable = true;
			package = pkgs.i3-gaps;
		};
	};

# Configure keymap in X11
	services.xserver.layout = "us";
	services.xserver.xkbOptions = "eurosign:e";

# Enable CUPS to print documents.
# services.printing.enable = true;

# Enable sound.
	sound.enable = true;
	hardware.pulseaudio.enable = true;

# Enable touchpad support (enabled default in most desktopManager).
	services.xserver.libinput.enable = true;
	services.xserver.libinput.naturalScrolling = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.wsz = {
		shell = pkgs.zsh;
		isNormalUser = true;
		extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
			packages = [
			pkgs.kitty
				pkgs.cmake
				pkgs.gcc
				pkgs.valgrind

				pkgs.rofi
				pkgs.firefox
				pkgs.chromium
				pkgs.redshift
				pkgs.xbindkeys
				pkgs.scientifica
			];
	};

# List packages installed in system profile. To search, run:
# $ nix search wget
	environment.systemPackages = with pkgs; [
		vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
			wget
			fasd
			fzf
			ack
			xclip
			htop
			tldr
			curl
			neovim
	];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "21.11"; # Did you read the comment?

}

