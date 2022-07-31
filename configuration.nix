# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
imports =
	[ # Include the results of the hardware scan.
	./hardware-configuration.nix
    ];


##############.
# System     #
##############.

# Touchpad
services.xserver.libinput.enable                    = true;
services.xserver.libinput.touchpad.middleEmulation  = true;
services.xserver.libinput.touchpad.naturalScrolling = true;
services.xserver.libinput.touchpad.tapping          = true;

# Xautolock ?
services.physlock.enable          = true;
services.physlock.allowAnyUser    = true;
services.xserver.xautolock.enable = true;
services.xserver.xautolock.locker = "/run/wrappers/bin/physlock";

# Backlight control
programs.light.enable    = true;

# Neovim
#environment.variables.EDITOR = "nvim";
#programs.neovim.enable       = true;
#programs.neovim.viAlias      = true;
#programs.neovim.vimAlias     = true;

# Firewall
networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 80 443 ];
  allowedUDPPortRanges = [
    { from = 0; to = 0; }
    { from = 0; to = 0; }
  ];
};

#########
# AUDIO #
#########

# Remove sound.enable or turn it off if you had it set previously, it seems to cause conflicts with pipewire
#sound.enable = false;

# rtkit is optional but recommended
security.rtkit.enable = true;
services.pipewire     = {
    enable              = true;
    alsa.enable         = true;
    alsa.support32Bit   = true;
    pulse.enable        = true;
    jack.enable         = true;
};

services.pipewire = {
  config.pipewire = {
    "context.properties" = {
      "link.max-buffers"          = 64;
      #"link.max-buffers"         = 16; # version < 3 clients can't handle more than this
      "log.level"                 = 2; # https://docs.pipewire.org/page_daemon.html
      "default.clock.rate"        = 48000;
      "default.clock.quantum"     = 4096;
      "default.clock.min-quantum" = 32;
      "default.clock.max-quantum" = 8192;
    };
  };
};


##############
#    ENV     #
##############

environment.sessionVariables = rec {
  DOT              = "\${HOME}/.nix";
  FZF_DEFAULT_OPTS = "--height 50%";
  ZDOTDIR          = "\${HOME}/.nix/config/zsh/";
  PATH             = [
    "\$DOT/bin/scripts"
    "\$DOT/bin/bookmarks"
  ];
};

##############.
# Bootloader #
##############.

boot.loader.systemd-boot.enable      = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.efi.efiSysMountPoint     = "/boot/efi";
systemd.extraConfig = "DefaulTimeOutStopSec=10s";

##############
# NETWORKING #
##############

networking.hostName              = "t460"; # Define your hostname.
networking.networkmanager.enable = true;
#networking.wireless.enable      = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
#networking.proxy.default        = "http://user:password@proxy:port/";
#networking.proxy.noProxy        = "127.0.0.1,localhost,internal.domain";

#######################################
#                 TLP                 #
#######################################

# https://discourse.nixos.org/t/thinkpad-t470s-power-management/8141/3

boot.kernelParams = ["intel_pstate=disable"];
services.tlp = {
  enable = true;
  settings = {
    CPU_BOOST_ON_BAT                = 0;
    CPU_SCALING_GOVERNOR_ON_AC      = "performance";
    CPU_SCALING_GOVERNOR_ON_BATTERY = "powersave";
    CPU_MAX_PERF_ON_AC              = 100;
    CPU_MAX_PERF_ON_BAT             = 75;
    START_CHARGE_THRESH_BAT0        = 50;
    STOP_CHARGE_THRESH_BAT0         = 90;
    RUNTIME_PM_ON_BAT               = "auto";
    RUNTIME_PM_ON_AC                = "on";
    SOUND_POWER_SAVE_ON_AC          = 0;
    SOUND_POWER_SAVE_ON_BAT         = 1;
    NATACPI_ENABLE                  = 1;
    TPACPI_ENABLE                   = 1;
    TPSMAPI_ENABLE                  = 1;
  };
};

boot.initrd.availableKernelModules = [
      # trimmed irrelevant ones
      "thinkpad_acpi"
    ];

#services.upower.enable = true;

#boot.extraModprobeConfig = lib.mkMerge [
  ## idle audio card after one second
  #"options snd_hda_intel power_save=1"
  ## enable wifi power saving (keep uapsd off to maintain low latencies)
  #"options iwlwifi power_save=1 uapsd_disable=1"
#];

#services.udev.extraRules = lib.mkMerge [
  ## autosuspend USB devices
  #''ACTION=="add", SUBSYSTEM=="usb", TEST=="power/control", ATTR{power/control}="auto"''
  ## autosuspend PCI devices
  #''ACTION=="add", SUBSYSTEM=="pci", TEST=="power/control", ATTR{power/control}="auto"''
  ## disable Ethernet Wake-on-LAN
  #''ACTION=="add", SUBSYSTEM=="net", NAME=="enp*", RUN+="${pkgs.ethtool}/sbin/ethtool -s $name wol d"''
#];


###########################################
# Select internationalisation properties. #
###########################################

time.timeZone            = "Europe/Paris";
i18n.defaultLocale       = "en_US.utf8";
i18n.extraLocaleSettings = {
	LC_ADDRESS           = "fr_FR.utf8";
	LC_IDENTIFICATION    = "fr_FR.utf8";
	LC_MEASUREMENT       = "fr_FR.utf8";
	LC_MONETARY          = "fr_FR.utf8";
	LC_NAME              = "fr_FR.utf8";
	LC_NUMERIC           = "fr_FR.utf8";
	LC_PAPER             = "fr_FR.utf8";
	LC_TELEPHONE         = "fr_FR.utf8";
	LC_TIME              = "fr_FR.utf8";
};

#################
# Configure X11 #
#################

services.autorandr.enable         = true;
services.xserver = {
	enable                        = true;
    autoRepeatDelay               = 250;
    autoRepeatInterval            = 25;
	layout                        = "us";
	xkbVariant                    = "";
    desktopManager.xterm.enable   = false;
    displayManager.startx.enable  = true;
    #displayManager.defaultSession = "none+i3";
	windowManager.i3              = {
		package = pkgs.i3-gaps;
		enable = true;
		      extraPackages = with pkgs; [
                   rofi
                   i3status
                   i3blocks
                   arandr
                   conky
                   unclutter
                   feh
                 ];
    	};
};


programs.zsh.enable = true;

############
# REDSHIFT #
############

services.redshift.enable      = true;
services.redshift.temperature = {day = 3750; night = 3750;};
location.latitude             = 0.0;
location.longitude            = 0.0;


#########
# FONTS #
#########

fonts.fonts = with pkgs; [
  noto-fonts
  liberation_ttf
  fira-code-symbols
  proggyfonts
  scientifica
  roboto
  nerdfonts
];

###################
# SYSTEM PACKAGES #
###################

nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
environment.systemPackages = with pkgs; [
  vim
  neovim
  tmux
  gnumake
  xorg.xgamma
  xorg.xset
  xorg.xev
  killall
  git
  xclip
  fzf
  ack
  tldr
  fasd
  nodejs
  trash-cli
  zplug
];

#########
# USERS #
#########

# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.wsz  = {
    shell        = pkgs.zsh;
	isNormalUser = true;
	description  = "wsz";
	extraGroups  = [ "networkmanager" "wheel" "video" ];
	packages     = with pkgs; [
                         # -- Audio
                         mpv
                         pulseaudio
                         pavucontrol
                         youtube-dl
                         # -- Data
                         croc
                         # -- Web
                         librewolf
                         #chromium
                         #firefox
                         #qutebrowser
                         #surf
                         # -- Utils
                         zplug
                         htop
                         nmap
                         rsstail
                         # -- Desktop GUI
                         #authy
                         bitwarden
                         element-desktop
                         tdesktop
                         signal-desktop
			];
};

users.users.sc  = {
    shell        = pkgs.zsh;
	isNormalUser = true;
	description  = "wsz";
	extraGroups  = [ "networkmanager" "wheel" "video" ];
	packages     = with pkgs; [
                         # -- Audio
                         supercollider-with-plugins
                         ghc
                         cabal-install
                         pulseaudio
                         pavucontrol
                         # -- Data
                         # -- Web
                         librewolf
                         #chromium
                         #firefox
                         #qutebrowser
                         #surf
                         # -- Utils
                         # -- Desktop GUI
                         #authy
			];
};


users.users.test  = {
    shell        = pkgs.zsh;
	isNormalUser = true;
	description  = "wsz";
	extraGroups  = [ "networkmanager" "wheel" "video" ];
	packages     = with pkgs; [
                         librewolf
			];
};

users.users.none  = {
    shell        = pkgs.zsh;
	isNormalUser = true;
	description  = "wsz";
	extraGroups  = [ "networkmanager" ];
	packages     = with pkgs; [
      gnome.gnome-boxes
			];
};


############
# DEFAULTS #
############

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
	system.stateVersion = "22.05"; # Did you read the comment?

}
